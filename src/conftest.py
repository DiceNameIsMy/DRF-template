import pytest

from django.urls import reverse

from rest_framework.test import APIClient

from apps.accounts.models import CustomUser


TOKEN_OBTAIN_URL = reverse('v1:token_obtain_pair')
TOKEN_REFRESH_URL = reverse('v1:token_refresh')


@pytest.fixture
def api_client() -> APIClient:
    return APIClient()


@pytest.fixture
def user() -> CustomUser:
    return CustomUser.objects.create_user(
        username='user',
        password='password',
        email='dummy@dummy.dummy',
    )


@pytest.fixture
def superuser() -> CustomUser:
    return CustomUser.objects.create_superuser(
        username='superuser',
        password='password',
        email='dummy@dummy.dummy',
    )
