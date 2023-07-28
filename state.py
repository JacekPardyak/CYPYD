from sys import path
path.append("")
from pyadomd import Pyadomd
conn_str = ""
def get_state():
  with Pyadomd(conn_str) as conn:
    df = print(conn.state)
    return df
