import os


SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL',
    "postgresql://flask_app:flask_app_password@pg:5432/flask_app")
SQLALCHEMY_TRACK_MODIFICATIONS = False