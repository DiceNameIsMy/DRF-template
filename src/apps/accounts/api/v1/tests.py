import pytest

from rest_framework.test import APIClient

from conftest import TOKEN_OBTAIN_URL


# fmt: off

@pytest.mark.django_db
@pytest.mark.parametrize(['expected_code', 'expected_items', 'credentials'], [
    (200, {'refresh', 'access'}, {'username': 'user', 'password': 'password'}),
    (401, {'detail', }, {'username': 'bad_user', 'password': 'password'}),
    (401, {'detail', }, {'username': 'user', 'password': 'bad_password'}),
    (400, {'username'}, {'password': 'password'}),
    (400, {'password'}, {'username': 'user'}),
    ]
)
def test_get_token(api_client: APIClient, user, expected_code, expected_items, credentials):
    r = api_client.post(TOKEN_OBTAIN_URL, data=credentials)

    assert r.status_code == expected_code
    assert set(r.json().keys()) == expected_items
