import numpy as np
import matplotlib
renderer = 'AGG'
matplotlib.use(renderer)
matplotlib.rcParams['svg.fonttype'] = 'none' # To make text in the resulting svg actual text, instead of a path. This can be done after importing pyplot.
matplotlib.rcParams['savefig.dpi'] = 150

from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
import matplotlib.pyplot as plt


power2 = 8
fBm = np.genfromtxt("fBm_diamondSquare_N%d.txt" %power2);
[m, n] = np.shape(fBm);
[x, y] = np.meshgrid(range(0,n), range(0,m))
# N = 2**power2 + 1

[w, h] = plt.figaspect(9./16.)
fig = plt.figure(figsize=[w,h])
ax = fig.gca(projection='3d')
# surf = ax.plot_surface(x, y, fBm, rstride=1, cstride=1, cmap=cm.coolwarm, linewidth=0, antialiased=True)
# surf = ax.plot_surface(x, y, fBm, cmap=cm.coolwarm, antialiased=True)
# surf = ax.plot_surface(x, y, fBm, rstride=1, cstride=1, cmap=cm.coolwarm, antialiased=True)
# surf = ax.plot_surface(x, y, fBm, rstride=1, cstride=1, cmap=cm.hsv, linewidth=0.2, antialiased=True)
surf = ax.plot_surface(x, y, fBm, rstride=1, cstride=1, cmap=cm.afmhot_r, linewidth=0., antialiased=True)


ax.set_xlim([0, m])
ax.set_ylim([0, n])
ax.set_zlim([np.min(fBm)*0.9, np.max(fBm)*1.1])

# x = ax.get_xticks()
# y = ax.get_yticks()
# z = ax.get_zticks()
# ax.set_xticks(np.linspace(min(x), max(x), 5))
# ax.set_yticks(np.linspace(min(y), max(y), 5))
# ax.set_xticks(np.linspace(0, m, 5))
# ax.set_yticks(np.linspace(0, n, 5))
# ax.set_zticks(np.linspace(min(z), max(z), 5))

ax.view_init(elev=35, azim=-60)

from matplotlib.ticker import LinearLocator, FormatStrFormatter
ax.xaxis.set_major_locator(LinearLocator(5))
ax.xaxis.set_major_formatter(FormatStrFormatter('%d'))
ax.yaxis.set_major_locator(LinearLocator(5))
ax.yaxis.set_major_formatter(FormatStrFormatter('%d'))
ax.zaxis.set_major_locator(LinearLocator(5))
ax.zaxis.set_major_formatter(FormatStrFormatter('%.1f'))

ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

# fig.colorbar(surf, shrink=0.5, aspect=5)

if renderer == 'AGG':
    # Remove ticks and labels
    # ax.set_xticks([])
    # ax.set_yticks([])
    # ax.set_zticks([])
    ax.xaxis.set_major_formatter(FormatStrFormatter(''))
    ax.yaxis.set_major_formatter(FormatStrFormatter(''))
    ax.zaxis.set_major_formatter(FormatStrFormatter(''))
    ax.set_xlabel('')
    ax.set_ylabel('')
    ax.set_zlabel('')

    plt.savefig("surface.png", bbox_inches='tight')
elif renderer == 'SVG':
    plt.savefig("surface.svg", bbox_inches='tight')
else:
    print 'error!'

# plt.show()
