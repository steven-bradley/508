import numpy as np

np.random.seed(420)
m = np.random.rand(5000, 5000)
y = np.random.rand(5000, 1)
n = np.matmul(m, m)
n = np.linalg.inv(m)
b = np.matmul(np.linalg.inv(np.matmul(np.transpose(m), m)), np.matmul(np.transpose(m), y))
np.linalg.eig(m)
