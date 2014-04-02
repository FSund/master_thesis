import matplotlib

ipython = False

if ipython:
    # do something
    ipython = True
else:
    renderer = 'svg'
    # renderer = 'AGG'
    matplotlib.use(renderer)
    matplotlib.rcParams['svg.fonttype'] = 'none' # To make text in the resulting svg actual text, instead of a path. 
    # matplotlib.rcParams['savefig.dpi'] = 500

import matplotlib.pyplot as plt
import numpy as np

# Set tick direction out
from matplotlib import rcParams
rcParams['xtick.direction'] = 'out'
rcParams['ytick.direction'] = 'out'

if ipython: 
    plt.ion()

filename = "lennard-jones"

sigma = 3.405 # angstrom
eps = 0.010318 # eV
r = np.linspace(2, 8, 1000)

U = 4*eps*((sigma/r)**12 - (sigma/r)**6)
F = -24*(eps/sigma)*(2*(sigma/r)**13 - (sigma/r)**7)

# fig = plt.figure()
default_fig_size = np.array([8.0, 6.0])
reduction_factor = 2.4
fig = plt.figure(1, figsize = default_fig_size/reduction_factor)
plt.plot(r, U)
plt.title('Plot of Lennard-Jones potential')
plt.xlim([2.8, 5.7])
plt.ylim([-0.0125, 0.0175])

ax = plt.gca()
# ax.spines['left'].set_position('zero')
# ax.spines['left'].set_position(('axes',0.6))
# ax.spines['left'].set_position(('data',sigma))
ax.spines['right'].set_color('none')
ax.spines['bottom'].set_position('zero')
ax.spines['top'].set_color('none')
# ax.spines['left'].set_smart_bounds(True)
# ax.spines['bottom'].set_smart_bounds(True)
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')
ax.xaxis.set_label_text('r [A]')
ax.yaxis.set_label_text('U(r) [eV]')

# We need to draw the canvas, otherwise the labels won't be positioned and 
# won't have values yet.
#fig.canvas.draw()

# Fix tick labels alignment -- Right is default, so doesn't change anything
# "fixed" this using manual aligning text to right in inkscape. The default matplotlib
# horizalignment is "right" though, so don't know why this was set to left in
# the .svg-file when opened in inkscape...
# ax.yaxis.get_label().set_horizontalalignment("left") # WRONG! Sets y-label, not ticklabel
# labels = [item.get_text() for item in ax.get_yticklabels()]
#labels = ax.get_yticklabels()
#[item.set_horizontalalignment("right") for item in labels]

# Remove zero on y axis
# labels = [item.get_text() for item in ax.get_yticklabels()]
# print labels
# labels[3] = ""
# ax.set_yticklabels(labels)

if ipython:
    plt.show()
else:
    plt.savefig(filename + ".svg", bbox_inches='tight')

# plt.figure()
# plt.plot(r, F)


