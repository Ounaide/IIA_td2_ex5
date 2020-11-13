# -*- coding: utf-8 -*-
"""
Created on Fri Nov 13 15:37:19 2020

@author: William
"""


from scipy import signal
import matplotlib.pyplot as plt


num=[0.0191]
den=[2,2,1]

sys = signal.TransferFunction(num,den)

w, mag, phase = signal.bode(sys)


f=plt.figure("diagrammes de Bode")

ax=f.add_subplot(211)
ax.grid(True)
ax.semilogx(w, mag, label="gain")
ax.set_ylabel("G (dB)")
ax.set_xlabel(r"$\omega$ (rad/s)")

ay=f.add_subplot(212)
ay.grid(True)
ay.semilogx(w, phase,label="$\phi")
ay.set_xlabel(r"$\omega$ (rad/s)")
ay.set_ylabel(r"$\varphi$ (°)")
plt.show()
