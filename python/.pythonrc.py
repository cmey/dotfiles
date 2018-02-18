# vim: set ft=python :
from __future__ import print_function

try:
    import numpy as np

    def rand(shape):
        return np.random.rand(*shape)
except:
    print("Could not import numpy package.")
else:
    print("Imported numpy package.")


try:
    import matplotlib.pyplot as plt

    def show(img, block=True, figure=None, title=None):
      if figure is None:
          f = plt.figure()
      if title is not None:
          plt.title(title)
      plt.imshow(abs(img))
      plt.colorbar()
      if block:
          plt.show()
      return f
      
except:
    print("Could not import matplotlib package.")
else:
    print("Imported matplotlib package.")
