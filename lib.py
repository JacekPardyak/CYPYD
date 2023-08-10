from sys import path
path.append("/Program Files/Microsoft.NET/ADOMD.NET/160")
from pyadomd import Pyadomd
from pandas import DataFrame
conn_str = "Data Source=localhost; Provider=MSOLAP; initial catalog=Analysis Services Tutorial"
def get_data(x):
  with Pyadomd(conn_str) as conn:
    with conn.cursor().execute(x) as cur:
      df = DataFrame(cur.fetchone(), columns=[i.name for i in cur.description])
      tmp = df.select_dtypes(include="object")
      tmp.fillna("NULL", inplace = True)
      df = tmp.join(df.select_dtypes(exclude="object"))
  return df
