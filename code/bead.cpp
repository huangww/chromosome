#include "bead.hpp"
#include "ultilities.hpp"
#include "config.hpp"
#include "force.hpp"
#include "rod.hpp"
#include "spring.hpp"
#include "montecarlo.hpp"
#include "constant.hpp"
#include "compute.hpp"
#include <fstream>
#include <iostream>
#include <iomanip>


Bead::Bead()
{
    r = NULL;
    rs = NULL;
    // v = NULL;
    f = NULL;
    ftotal = NULL;

    force = NULL;
    rod = NULL;
    spring = NULL;
    config = NULL;
    montecarlo = NULL;
    compute = NULL;
}
Bead::~Bead() 
{
    delete2DArray(r);
    delete2DArray(rs);
    // delete2DArray(v);
    delete2DArray(f);
    delete2DArray(ftotal);

    delete force;
    delete rod;
    delete spring;
    delete config;
    delete montecarlo;
    delete compute;
}

void Bead::setParameter(Input *input)
{
    if (input->parameter.count("nBead") == 0) {
        throw "Parameter \"nBead\" is not specified!";
    }
    nBead = int(input->parameter["nBead"]);
    if (input->parameter.count("dt") == 0) {
        throw "Parameter \"dt\" is not specified!";
    }
    dt = input->parameter["dt"];
    
    // set up the state class
    r = create2DArray<double>(nBead, DIM);
    rs = create2DArray<double>(nBead, DIM);
    // v = create2DArray<double>(nBead, DIM);
    f = create2DArray<double>(nBead, DIM);
    ftotal = create2DArray<double>(nBead, DIM);

    force = new Force();
    force->setParameter(input);
    if (input->projectName=="BeadRod") {
        rod = new Rod(this);
        rod->setParameter(input);
    }
    if (input->projectName=="BeadSpring") {
        spring = new Spring();
        spring->setParameter(input);
    }
    config = new Config();
    config->setParameter(input);
    montecarlo = new Montecarlo();
    montecarlo->setParameter(input);
    compute = new Compute();
}

void Bead::init() 
{
    t = 0.0;

    r = config->init(r);
    montecarlo->randomize(r);
    // montecarlo->equilibrate(r);
    
    std::copy(&r[0][0], &r[0][0] + nBead * DIM, &rs[0][0]);
    // std::fill(&v[0][0], &v[0][0]+nBead*DIM, 0);
    std::fill(&f[0][0], &f[0][0]+nBead*DIM, 0);
    std::fill(&ftotal[0][0], &ftotal[0][0]+nBead*DIM, 0);
}

void Bead::print() 
{
    std::cout << "t = " << t << std::endl;
    std::cout << "Position: " << std::endl;
    for (int i = 0; i < nBead; ++i) {
        std::cout << i << '\t';
        for (int j = 0; j < DIM; ++j) {
            std::cout << std::setw(9) << r[i][j] << '\t';
        }
        std::cout << std::endl;
    }
    std::cout << "Specific Force: " << std::endl;
    for (int i = 0; i < nBead; ++i) {
        std::cout << i << '\t';
        for (int j = 0; j < DIM; ++j) {
            std::cout << std::setw(9) << f[i][j] << '\t';
        }
        std::cout << std::endl;
    }
    std::cout << "Total Force: " << std::endl;
    for (int i = 0; i < nBead; ++i) {
        std::cout << i << '\t';
        for (int j = 0; j < DIM; ++j) {
            std::cout << std::setw(9) << ftotal[i][j] << '\t';
        }
        std::cout << std::endl;
    }
}

void Bead::pinSPB() 
{
    for (int i = 0; i < DIM; ++i) {
        ftotal[0][i] += -1000.0*r[0][i];
    }
}

void Bead::addForce(double **f)
{
    for (int i = 0; i < nBead; ++i) {
        for (int j = 0; j < DIM; ++j) {
            ftotal[i][j] += f[i][j];
        }
    }
}

void Bead::predict()
{
    std::fill(&ftotal[0][0], &ftotal[0][0] + nBead * DIM, 0);
    // addForce(rod->pseudo(f));
    // addForce(rod->pseudoSparse(f));
    addForce(rod->pseudoRing(f));
    addForce(force->brownian(f));
    addForce(force->external(f));
    // addForce(force->repulsive(f));
    
    // predict the next step position as rs
    for (int i = 0; i < nBead; ++i) {
        for (int j = 0; j < DIM; ++j) {
            rs[i][j] = r[i][j] + ftotal[i][j] * dt;
        }
    }
    
}

void Bead::correct()
{
    f = rod->constraint(f);

    for (int i = 0; i < nBead; ++i) {
        for (int j = 0; j < DIM; ++j) {
            r[i][j] = rs[i][j] + f[i][j] * dt;
        }
    }

    t += dt;
}

void Bead::update()
{
    std::fill(&ftotal[0][0], &ftotal[0][0] + nBead * DIM, 0);
    addForce(force->brownian(f));
    addForce(force->external(f));
    addForce(spring->harmonic(r, f));
    // addForce(force->repulsive(f));
    pinSPB();
    
    // predict the next step position as rs
    for (int i = 0; i < nBead; ++i) {
        for (int j = 0; j < DIM; ++j) {
            r[i][j] = r[i][j] + ftotal[i][j] * dt;
        }
    }

    t += dt;
}

void Bead::montecarloUpdate()
{
    montecarlo->move(r);
    t += dt;
}

void Bead::output(std::ofstream* output) 
{
    outputPos(output[0]);
    outputRg(output[1]);
    outputRd(output[2]);
}

void Bead::outputPos(std::ofstream& output) 
{
    output << "# t = " << t << std::endl;
    for (int i = 0; i < nBead; ++i) {
        for (int j = 0; j < DIM; ++j) {
            output << std::setw(9) << r[i][j] << '\t';
        }
        output << std::endl;
    } 
}

void Bead::outputRg(std::ofstream& output)
{
    double rg = compute->gyrationRadius(nBead, r);
    output << std::setw(9) << t << '\t'
        << std::setw(9) << rg << std::endl;
}

void Bead::outputRd(std::ofstream& output)
{
    for (int i = 0; i < DIM; ++i) {
        output << std::setw(9) << r[nBead/2][i] - r[0][i] << '\t';
    }
    output << std::endl;
}
