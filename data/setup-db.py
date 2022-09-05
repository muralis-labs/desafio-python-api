import sqlite3

def create_db():
    # open database connection
    db = sqlite3.connect('database.db')
    cursor = db.cursor()

    # read sql dump file
    sql_file = open('./dump.sql', 'r')
    sql_str = sql_file.read()

    # run sql queries
    cursor.executescript(sql_str)

    db.commit()
    db.close()

create_db()