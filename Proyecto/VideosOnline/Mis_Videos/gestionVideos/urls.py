from django.urls import path
from . import views

urlpatterns = [
    path('', views.capturarDatosUsuario, name='capturarDatosUsuario'),
    path('validarDatosUsuario/', views.validarDatosUsuario, name='validarDatosUsuario'),
    path('fullData/', views.fullData, name='fullData'),
    path('popup/', views.popup, name='popup'),
]