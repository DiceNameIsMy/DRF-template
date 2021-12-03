from django.contrib.auth.models import AbstractUser


class CustomUser(AbstractUser):
    pass

    class Meta:
        db_table = 'user'
        verbose_name = 'User'
        verbose_name_plural = 'Users'
