import unittest
from app import app

class TestLogin(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_login_correct_credentials(self):
        response = self.app.post('/login', json={'email': 'gerente@gmail.com', 'contrasena': 'password'})
        data = response.get_json()
        self.assertEqual(response.status_code, 200)
        self.assertIn('mensaje', data)
        self.assertEqual(data['mensaje'], 'Inicio de sesión exitoso')

    def test_login_incorrect_credentials(self):
        response = self.app.post('/login', json={'email': 'gerente@gmail.com', 'contrasena': 'wrongpassword'})
        data = response.get_json()
        self.assertEqual(response.status_code, 401)
        self.assertIn('error', data)
        self.assertEqual(data['error'], 'Credenciales incorrectas')

if __name__ == '__main__':
    unittest.main()

