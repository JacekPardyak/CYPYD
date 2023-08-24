import pandas as pd
import numpy as np
import string
from decimal import Decimal
Decimal(1/7)

def build_py_df():
  np.random.seed(6520)
  random_df = pd.DataFrame(
    {'decimal' : list(map(Decimal, np.random.randn(500))),
    'charNone': np.random.choice(["ssas", "python", "r", None], 500),
    'int': np.random.randint(1, 10, 500),
    'num': np.random.randn(500),
    'char': [''.join(np.random.choice(list(string.ascii_lowercase[1:10]), 3)) for _ in range(500)],
    'bool': np.random.choice([True, False], 500),
    'date': np.random.choice(pd.date_range('2000-01-01', '2019-05-31'), 500),
    'numNaN': np.random.choice([1, np.NaN], 500)
    })
  return random_df
tmp = build_py_df()

cols = tmp.columns
for col in cols:
  if isinstance(tmp[col][0], Decimal):
    tmp[col] = tmp[col].apply(float)
  if isinstance(tmp[col][0], str):
    tmp[col] =  tmp[col].fillna("ALL")

tmp.dtypes
tmp['decimal'].dtype

float(tmp['decimal'][1]) # one value conversion
tmp['decimal'] = tmp['decimal'].apply(float)
tmp.dtypes



