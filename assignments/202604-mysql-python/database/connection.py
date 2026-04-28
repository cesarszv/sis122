import mysql.connector
from config.db_config import DB_CONFIG

def obtener_conexion():
    try
    conexion = mysql.connector.connect(**DB CONFIG)
    print("conectado a la base de datos")
    return conexion
    except mysql.connector.Error as err:
    print("error de conexión:", err)
    return None

