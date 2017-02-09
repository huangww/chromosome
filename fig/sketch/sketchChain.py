from vpython import *
import numpy as np
import povexport

# number of beads
N = 15

# set up the scene or movie
bg = vector(1., 1., 1.)
scene = canvas(width=800, height=480, background=bg)
factor = 0.2
scale = 0.5

## load data of bead position
fname = 'posChain.dat'
print fname
pos = np.loadtxt(fname,comments='#')

# generate beads
bead = [sphere(pos = vec(pos[i,0],pos[i,1],pos[i,2]),
    radius = 1.0*factor,
    color = color.blue) 
    for i in range(N)]
   
# Connect beads with springs
link = [[i, (i+1)%N] for i in range(N-1)]
spring = [helix(pos=bead[l[0]].pos, 
    axis = bead[l[1]].pos - bead[l[0]].pos,
    radius = 0.5 * factor, 
    color = color.black,
    # color = vector(0.1,0.1,1),
    thickness = 0.1*factor,
    coils = 10) for l in link]

center = vec((np.max(pos[:,0]) + np.min(pos[:,0]))/2.,\
	  (np.max(pos[:,1]) + np.min(pos[:,1]))/2.,\
	  (np.max(pos[:,2]) + np.min(pos[:,2]))/2.)
scene.center = center

