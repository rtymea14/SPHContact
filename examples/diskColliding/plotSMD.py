import numpy as np
import matplotlib.pyplot as plt
import math
import Image
f1 = "log" + ".lammpsSMD"
t1 = np.loadtxt(f1, unpack=True,skiprows = 1, usecols=[1])
fx1 = np.loadtxt(f1, unpack=True,skiprows = 1, usecols=[4])
fy1 = np.loadtxt(f1, unpack=True,skiprows = 1, usecols=[5])

l1 = "USER-SMD case"  

plt.figure(figsize=(6,5))
scale = 5
plt.rcParams["font.family"] = "serif"
time = np.cumsum(t1)
force = []
for i in range(0,len(fx1)):
    force.append(math.sqrt(fx1[i]*fx1[i]+fy1[i]*fy1[i]))

plt.plot(time, force,  linestyle = '-', color = 'blue', label = l1)

plt.ylabel('Force (N)', fontsize = 12)
plt.xlabel('Time (sec)', fontsize = 12)
plt.legend()
plt.tight_layout()
file4 = 'SMDplot' +".png"
plt.savefig(file4)
Image.open(file4).save('SMDplot.jpg','JPEG')
plt.show()
