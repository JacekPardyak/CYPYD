from sys import path
path.append("")
from pyadomd import Pyadomd
from pandas import DataFrame
conn_str = ""
def get_data(x):
  with Pyadomd(conn_str) as conn:
    with conn.cursor().execute(x) as cur:
      df = DataFrame(cur.fetchone(), columns=[i.name for i in cur.description])
      df = df.fillna("NA") # needed to smoothly convert to R tibble
  return df
