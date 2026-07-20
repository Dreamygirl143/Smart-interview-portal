import os
from dotenv import load_dotenv

load_dotenv()

HOST = os.getenv("DB_HOST")
PORT = int(os.getenv("DB_PORT", 3306))
USER = os.getenv("DB_USER")
PASSWORD = os.getenv("DB_PASSWORD")
DATABASE = os.getenv("DB_NAME")