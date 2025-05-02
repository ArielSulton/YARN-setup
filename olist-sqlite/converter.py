import sqlite3
import pandas as pd
import os

db_file = 'olist.sqlite'  # extract '.xz' file first
output_folder = 'csv_output'
os.makedirs(output_folder, exist_ok=True)

conn = sqlite3.connect(db_file)

cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cursor.fetchall()

for table_name in tables:
    table_name = table_name[0]
    print(f"Exporting {table_name}...")

    df = pd.read_sql_query(f"SELECT * FROM {table_name}", conn)

    csv_path = os.path.join(output_folder, f"{table_name}.csv")
    df.to_csv(csv_path, index=False)

conn.close()
print("Semua tabel berhasil di-export ke folder:", output_folder)
