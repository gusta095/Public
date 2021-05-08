import sqlite3

con = sqlite3.connect('pesasus.db')
cur = con.cursor()

sql_create = 'create table cursos (id integer primary key, nome varchar(100), senha varchar(40))'

cur.execute(sql_create)

