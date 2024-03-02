from flask import Flask
from flask_mysqldb import MySQL
from config import Config
from auth import auth_bp

app = Flask(__name__)
app.config.from_object(Config)
conexion = MySQL(app)

# Ruta para verificar la conexión a la base de datos
@app.route('/verificar_conexion')
def verificar_conexion():
    try:
        cursor = conexion.connection.cursor()
        cursor.execute('SELECT 1')
        return 'La conexión a la base de datos está funcionando correctamente.'
    except Exception as e:
        return f'Error al conectar a la base de datos: {str(e)}'

# Registrar el blueprint de autenticación en la aplicación
app.register_blueprint(auth_bp)

if __name__ == '__main__':
    app.run(debug=True)



