from django.contrib import admin
from django.urls import path, include

# fmt: off

urlpatterns = [
    path("admin/", admin.site.urls),
    path("v1/", include((
        [
            path("accounts/", include("accounts.api.v1.urls")),
        ],
        "v1",
    ))),
]
