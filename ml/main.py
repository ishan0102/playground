import numpy as np

a = np.array([2, 1]).reshape(1, 2)
b = np.array([2, -2, 3, 1]).reshape(2, 2)
c = np.array([2, 1, 2, -3, -1, 0]).reshape(2, 3)
d = np.array([4, 1, 2]).reshape(3, 1)

print(a @ b @ c @ d)