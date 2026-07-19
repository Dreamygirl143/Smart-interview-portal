import os
from dotenv import load_dotenv

load_dotenv()

HOST = os.getenv("MYSQLHOST")
PORT = int(os.getenv("MYSQLPORT", 3306))
USER = os.getenv("MYSQLUSER")
PASSWORD = os.getenv("MYSQLPASSWORD")
DATABASE = os.getenv("MYSQLDATABASE")