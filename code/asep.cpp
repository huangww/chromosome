#include "asep.hpp"
#include "project.hpp"
#include "state.hpp"
#include "input.hpp"
#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <cmath>
#include <iomanip>

Asep::Asep() : Project()
{
    state = new State();
    outFile = new std::ofstream[2];  
}
Asep::~Asep() 
{ 
    delete state;
    outFile[0].close();
    outFile[1].close();
    delete[] outFile;
}

void Asep::setup(Input *input) 
{
    state->setParameter(input);
    nSample = int(input->parameter["nSample"]);
    outputStep = int(input->parameter["outputStep"]);
    tEnd = input->parameter["tEnd"];

    // Open files for output
    std::ostringstream fname;
    fname << "data/par_N" << input->parameter["nSite"] << "_T"
        << input->parameter["tempEff"] << ".dat";
    outFile[0].open(fname.str());
    fname.str("");
    fname << "data/rg1D_N" << input->parameter["nSite"] << "_T"
        << input->parameter["tempEff"] << ".dat";
    std::cout << fname.str() << std::endl;
    outFile[1].open(fname.str());
}

void Asep::run() 
{
    // int nRg = int(tEnd / state->dt);
    // double *rgMean = new double[nRg];
    // std::fill(&rgMean[0], &rgMean[0] + nRg, 0);
   
    for (int i = 0; i < nSample; ++i) {

        state->init();

        int step = 0;
        while (state->t < tEnd) {
            // output to data file
            if (step % outputStep == 0) {
                state->output(outFile);
            }

            // rgMean[step] += state->rg;
            state->update();
            step++;
        }

        // output progressing to screen
        std::cout << i <<  std::endl;
    }

    // for (int i = 0; i < nRg; ++i) {
    //     output[1] << std::setprecision(9) << std::setw(10);
    //     output[1] << i*state->dt << '\t';
    //     output[1] << rgMean[i] / state->nSample 
    //         << std::endl;
    // }
    // delete [] rgMean;
}