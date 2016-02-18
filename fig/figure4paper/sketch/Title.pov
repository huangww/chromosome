 // povray code generated by povexport.py

// Four-sided pyramid from shapes2.inc, slightly modified.
#declare Pyramid = union {
    triangle { <0, -1, -1>, <0, +1, -1>, <1, 0, 0> }
    triangle { <0, +1, -1>, <0, +1, +1>, <1, 0, 0> }
    triangle { <0, -1, +1>, <0, +1, +1>, <1, 0, 0> }
    triangle { <0, -1, +1>, <0, -1, -1>, <1, 0, 0> }
    triangle { <0, -1, -1>, <0, -1, +1>, <0, 1, 1> }
    triangle { <0, -1, -1>, <0, +1, -1>, <0, 1, 1> }
    scale <1, .5, .5>        // so height = width = 1
}

global_settings { ambient_light rgb <2.000000, 2.000000, 2.000000> }

background { color rgb <1.000000, 1.000000, 1.000000> }

light_source { <218.217890, 436.435780, 872.871561>
    color rgb <0.800000, 0.800000, 0.800000>
}

light_source { <-872.871561, -218.217890, -436.435780>
    color rgb <0.300000, 0.300000, 0.300000>
}

camera {
    right <-1.333333, 0, 0>      //visual uses right-handed coord. system
    location <0.036068, 0.233122, 13.340121>
    sky <0.000000, 1.000000, 0.000000>
    look_at <0.036068, 0.233122, -0.077484>
    angle 60.000000
    rotate <0, 0, 0>
}

sphere {
    <0.117377, -0.031596, 0.017820>, 0.600000
    pigment {color rgbt <1.000000, 0.000000, 0.000000, 0.000000>}   
}


 union{  
 	sphere{<4.2382688749478120E-003,-4.9855054240550783E-002,0>,0.3 texture{pigment{color Red}} finish{phong 1}}
	union{	
		sphere{<0.839759, -0.669981, 0.283580>,	0.2}
		sphere{<1.776648, -0.856919, 0.579033>,	0.2 }
		sphere{<2.7331175167468778,6.0658851235484285E-002,0>,	0.2}
		sphere{<3.7250099839142163,0.18773887947238060,0>,	0.2}
		sphere{<3.5357686084597018,-0.79419171981459724,0>,	0.2}
		sphere{<2.5357704648113502,-0.79226488306732201,0>,	0.2}
		sphere{<2.1725359831676712,-1.7239626405751136,0>,	0.2}
		sphere{<1.5555247635575162,-0.93700828683203319,0>,	0.2}
		sphere{<0.55697280866827004,-0.88321243767185442,0>,	0.2}
		texture{pigment{color Green}}
		finish{phong 1}
//		normal { bumps 0.4 scale 0.2 }
	}


sphere {
    <0.839759, -0.669981, 0.283580>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <1.776648, -0.856919, 0.579033>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <2.729676, -1.013058, 0.319497>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <3.588657, -1.466057, 0.080869>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <4.566778, -1.274397, -0.000029>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <5.548086, -1.466831, 0.002032>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <6.246263, -0.779688, -0.198925>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <6.545694, 0.042727, 0.284785>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <5.579506, 0.044207, 0.026952>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <4.859897, -0.206367, -0.620640>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <3.917354, -0.428664, -0.371248>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <2.964692, -0.196729, -0.567821>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <1.970323, -0.296468, -0.531994>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <0.980422, -0.169988, -0.467978>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <0.991352, 0.179832, 0.455388>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <1.978902, 0.337039, 0.449802>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <2.922226, 0.355975, 0.781135>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <3.907897, 0.424925, 0.627196>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <4.907107, 0.457357, 0.650151>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <5.738312, 0.943304, 0.920254>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <6.635515, 1.041961, 0.489798>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <6.251149, 1.795838, -0.043055>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <5.595824, 1.372292, -0.668482>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <4.630903, 1.151971, -0.811255>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <3.683918, 1.061149, -0.503080>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <2.727817, 0.898941, -0.259031>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <1.790523, 0.554723, -0.313745>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

sphere {
    <0.793960, 0.635282, -0.294443>, 0.300000
    pigment {color rgbt <0.800000, 0.200000, 0.800000, 0.000000>}
    
    
}

cylinder {
    <0.117377, -0.031596, 0.017820>,<0.839759, -0.669981, 0.283580>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <0.839759, -0.669981, 0.283580>,<1.776648, -0.856919, 0.579033>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <1.776648, -0.856919, 0.579033>,<2.729676, -1.013058, 0.319497>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <2.729676, -1.013058, 0.319497>,<3.588657, -1.466057, 0.080869>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <3.588657, -1.466057, 0.080869>,<4.566778, -1.274397, -0.000029>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <4.566778, -1.274397, -0.000029>,<5.548086, -1.466831, 0.002032>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <5.548086, -1.466831, 0.002032>,<6.246263, -0.779688, -0.198925>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <6.246263, -0.779688, -0.198925>,<6.545694, 0.042727, 0.284785>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <6.545694, 0.042727, 0.284785>,<5.579506, 0.044207, 0.026952>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <5.579506, 0.044207, 0.026952>,<4.859897, -0.206367, -0.620640>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <4.859897, -0.206367, -0.620640>,<3.917354, -0.428664, -0.371248>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <3.917354, -0.428664, -0.371248>,<2.964692, -0.196729, -0.567821>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <2.964692, -0.196729, -0.567821>,<1.970323, -0.296468, -0.531994>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <1.970323, -0.296468, -0.531994>,<0.980422, -0.169988, -0.467978>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <0.980422, -0.169988, -0.467978>,<0.117377, -0.031596, 0.017820>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <0.117377, -0.031596, 0.017820>,<0.991352, 0.179832, 0.455388>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <0.991352, 0.179832, 0.455388>,<1.978902, 0.337039, 0.449802>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <1.978902, 0.337039, 0.449802>,<2.922226, 0.355975, 0.781135>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <2.922226, 0.355975, 0.781135>,<3.907897, 0.424925, 0.627196>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <3.907897, 0.424925, 0.627196>,<4.907107, 0.457357, 0.650151>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <4.907107, 0.457357, 0.650151>,<5.738312, 0.943304, 0.920254>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <5.738312, 0.943304, 0.920254>,<6.635515, 1.041961, 0.489798>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <6.635515, 1.041961, 0.489798>,<6.251149, 1.795838, -0.043055>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <6.251149, 1.795838, -0.043055>,<5.595824, 1.372292, -0.668482>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <5.595824, 1.372292, -0.668482>,<4.630903, 1.151971, -0.811255>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <4.630903, 1.151971, -0.811255>,<3.683918, 1.061149, -0.503080>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <3.683918, 1.061149, -0.503080>,<2.727817, 0.898941, -0.259031>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <2.727817, 0.898941, -0.259031>,<1.790523, 0.554723, -0.313745>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <1.790523, 0.554723, -0.313745>,<0.793960, 0.635282, -0.294443>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}

cylinder {
    <0.793960, 0.635282, -0.294443>,<0.117377, -0.031596, 0.017820>, 0.150000
    pigment { color rgbt <0.800000, 0.200000, 0.800000, 0.000000> }
    
    
}
