from sys import path
path.append("/Program Files/Microsoft.NET/ADOMD.NET/160")
from pyadomd import Pyadomd
conn_str = "Data Source=localhost; Provider=MSOLAP; initial catalog=Analysis Services Tutorial"
def get_state():
  with Pyadomd(conn_str) as conn:
    df = print(conn.state)
    return df
