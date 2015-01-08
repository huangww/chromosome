#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "solver.h"
#include "random.h"
#include "utilities.h"


void CalculateFc(double r[beadNumber][dimension],
		double rs[beadNumber][dimension],
		int link[rodNumber][2],
		int g[rodNumber][rodNumber],
		double fc[beadNumber][dimension])
{
	double u[rodNumber][dimension];
	CalculateVectorU(r, link, u);

	double b[rodNumber][dimension];
	CalculateVectorB(rs, link, b);

	double tension[rodNumber]= {0};
	Picard(b, u, g, tension);
	memset(fc, 0, sizeof(fc[0][0]) * beadNumber * dimension);
	for (int i = 0; i < beadNumber; i++) {
		for (int j = 0; j < rodNumber; j++) {
			if (link[j][0] == i) {
				for (int k = 0; k < dimension; k++) {
					fc[i][k] = fc[i][k] + tension[j] * u[j][k];
				}
			}
			if (link[j][1] == i) {
				for (int k = 0; k < dimension; k++) {
					fc[i][k] = fc[i][k] - tension[j] * u[j][k];
				}
			}
		}
	}

	
}

void GenerateFb(double fb[beadNumber][dimension],
		unsigned long seed)
{
	for (int i = 0; i < beadNumber; i++) {
		for (int j = 0; j < dimension; j++) {
			fb[i][j] = sqrt(2.0/dt) * GaussRan(seed);
		}
	}
	
}

double LennardJonesPotential(double r[beadNumber][dimension])
{	
	double plj = 0.0;
	double r0 = 0.75;
	double eps = 1.0;
	for (int i = 0; i < beadNumber; ++i)
	{
		for (int j = i+1; j < beadNumber; ++j)
		{
			double rsd = 0;
			for (int k = 0; k < dimension; ++k)
			{
				rsd = rsd + (r[i][k] - r[j][k]) * (r[i][k] - r[j][k]);
			}
			if (pow(rsd, 3) <= 2*pow(r0,6))
			{
				double r6;
				r6 = pow(r0*r0/rsd, 3);
				plj += 4*eps*(r6*r6 - r6) + eps;
			}
		}
	
	}
	return plj;
}

void LennardJonesForce(double r[beadNumber][dimension],
		double f[beadNumber][dimension])
{
	memset(f, 0, sizeof(f[0][0])*beadNumber*dimension);
	double r0 = 0.75;
	double eps = 1.0;
	for (int i = 0; i < beadNumber; ++i)
	{
		for (int j = i+1; j < beadNumber; ++j)
		{
			double rsd = 0;
			for (int k = 0; k < dimension; ++k)
			{
				rsd = rsd + (r[i][k] - r[j][k]) * (r[i][k] - r[j][k]);
			}
			if (pow(rsd, 3) <= 2*pow(r0,6))
			{
				double r6;
				r6 = pow(r0*r0/rsd, 3);
				for (int k = 0; k < dimension; ++k)
				{
					f[i][k] = f[i][k] + 48 * eps *
						(r6 - 0.5) * r6 *
						(r[i][k]-r[j][k])/rsd;
					f[j][k] = f[j][k] - 48 * eps *
						(r6 - 0.5) * r6 *
						(r[i][k]-r[j][k])/rsd;
				}
				
			}
		}
	
	}
	
}


extern int dgetrf_(int* m, int* n, double* A, 
		int* lda, int* ipiv, int* info);

extern int dgetri_(int* m, double* a, int* lda,
		int* ipiv, double* work, int* lwork, int* info);


void PseudoForce(double r[beadNumber][dimension],
		int link[rodNumber][2],
		int g[rodNumber][rodNumber],
		double f[beadNumber][dimension])
{
	memset(f, 0, sizeof(f[0][0])*beadNumber*dimension);
	double u[rodNumber][dimension];
	CalculateVectorU(r, link, u);
	double metric[rodNumber*rodNumber] = {0};
	CalculateAij(u, u, g, metric); 
	for (int i = 0; i < rodNumber*rodNumber; ++i)
	{
		metric[i] = -metric[i];
	}

	/* calculate the inverse of the metric matrix */
	int n = rodNumber;
	int ipiv[rodNumber];
	int info;
	double work[rodNumber];
	dgetrf_(&n, &n, metric, &n, ipiv, &info);
	dgetri_(&n, metric, &n, ipiv, work, &n, &info);

	for (int k = 0; k < beadNumber; ++k)
	{
		for (int i = 0; i < rodNumber; ++i)
		{
			for (int j = i+1; j < rodNumber; ++j)
			{
				if (abs(g[i][j]) == 1)
				{
					int i0,i1,j0,j1;
					i0 = link[i][0];
					i1 = link[i][1];
					j0 = link[j][0];
					j1 = link[j][1];
					if ((k-i0)*(k-i1)*(k-j0)*(k-j1)==0)
					{
						double uij;
						uij = ddot(&u[i][0], &u[j][0]); 
						double pgr[dimension];
						for (int m = 0; m < dimension; ++m)
						{
							pgr[m] = (delta(k,i1) - delta(k,i0)) *
								(u[j][m] - uij * u[i][m]) +
								(delta(k,j1) - delta(k, j0)) *
								(u[i][m] - uij * u[j][m]);			
							f[k][m] = f[k][m] + g[j][i] * metric[i*rodNumber+j] * pgr[m];
						}
					}


				}
			}
		}
	}

}