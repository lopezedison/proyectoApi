from flask import Blueprint, request, jsonify
from flask_mysqldb import MySQL

auth_bp = Blueprint('auth', __name__)
conexion = MySQL()

@auth_bp.route('/login', methods=['POST', 'GET'])
def login():
    try:
        email = request.json.get('email')
        contrasena = request.json.get('contrasena')

        cursor = conexion.connection.cursor()
        cursor.execute('SELECT UserID, NombreUsuario, Email, TipoUsuario FROM Usuario WHERE Email = %s AND Contraseña = %s', (email, contrasena))
        user = cursor.fetchone()
        cursor.close()

        if user:
            return jsonify({'mensaje': 'Inicio de sesión exitoso', 'usuario': user}), 200
        else:
            return jsonify({'error': 'Credenciales incorrectas'}), 401
    except Exception as e:
        return jsonify({'error': 'Error al procesar la solicitud: {}'.format(str(e))}), 500


