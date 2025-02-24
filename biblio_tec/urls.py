from django.urls import path
from . import views

urlpatterns = [
    path('registrar-libro/', views.registrar_libro, name='registrar-libro'),
    path('realizar-prestamo/', views.realizar_prestamo, name='realizar-prestamo'),
]
