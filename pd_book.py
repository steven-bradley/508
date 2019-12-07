import numpy as np
import pandas as pd

np.random.seed(420)
m = pd.DataFrame.from_records(np.random.rand(5000, 5000))
y = pd.DataFrame.from_records(np.random.rand(5000, 1))

n = pd.DataFrame.dot(m, m)

n = pd.DataFrame(np.linalg.inv(m.values), m.columns, m.index)

t = pd.DataFrame.transpose(m)
tm = pd.DataFrame.dot(t, m)
inv_tm = pd.DataFrame(np.linalg.inv(tm.values), tm.columns, tm.index)

b = pd.DataFrame.dot(
    inv_tm,
    pd.DataFrame.dot(
        pd.DataFrame.transpose(m),
        y
    )
)

np.linalg.eig(m)