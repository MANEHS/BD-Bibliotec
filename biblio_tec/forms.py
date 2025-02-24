from django import forms

class RegistrarLibroForm(forms.Form):
    id_libro = forms.IntegerField(label='ID del Libro')
    nomb_libro = forms.CharField(label='Nombre del Libro', max_length=255)
    editorial = forms.CharField(label='Editorial', max_length=255)
    isbn = forms.CharField(label='ISBN', max_length=255)
    num_paginas = forms.IntegerField(label='Número de Páginas')
    id_autor = forms.IntegerField(label='ID del Autor')
    id_genero = forms.IntegerField(label='ID del Género')

class RealizarPrestamoForm(forms.Form):
    id_usuario = forms.IntegerField(label='ID del Usuario')
    id_libro = forms.IntegerField(label='ID del Libro')
    fecha_prestamo = forms.DateField(label='Fecha de Préstamo', widget=forms.SelectDateWidget())
    dias_prestamo = forms.IntegerField(label='Días de Préstamo')
    fecha_devuelto = forms.DateField(label='Fecha de Devolución', widget=forms.SelectDateWidget())

