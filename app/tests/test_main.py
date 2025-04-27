import sys
import os
import pytest

# הוסף את הנתיב של תיקיית הפרויקט
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..')))

from app.main import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_home(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello, DevOps!" in response.data

def test_echo(client):
    response = client.post('/echo', json={"message": "hi"})
    assert response.status_code == 200
    assert response.get_json() == {"message": "hi"}
