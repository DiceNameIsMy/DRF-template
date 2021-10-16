from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include([
        path('v1/', include([
            path('accounts/', include('apps.accounts.api.v1.urls')),
        ])),
    ])),
]
