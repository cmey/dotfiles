#!~/.pyenv/shims/python

import imageio
import sys

if len(sys.argv) < 4:
    print('Usage: gif output.gif [frame duration in ms] *.png')
    sys.exit(0)

output_fname = sys.argv[1]
duration = int(sys.argv[2])
fnames = sys.argv[3:]

images = []
for fname in fnames:
    images.append(imageio.imread(fname))
imageio.mimsave(output_fname, images, duration=duration/1000)
