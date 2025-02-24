from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.core.management import call_command
import os
from django.conf import settings
from django.db import connection
from django.contrib import messages

from .forms import RegistrarLibroForm, RealizarPrestamoForm
from django.http import HttpResponseRedirect

def backup_database(request):
    call_command('backup_db')
    return HttpResponse("Respaldo completado.")

def restore_database(request):
    try:
        call_command('restore_db')
        return HttpResponse("Base de datos restaurada correctamente.")
    except Exception as e:
        return HttpResponse(f"Error al restaurar la base de datos: {str(e)}", status=500)


def consultar_prestamos(request, id_usuario):
    try:
        with connection.cursor() as cursor:
            cursor.callproc('ConsultarPrestamos', [id_usuario])  # Llamada al procedimiento
            prestamos = cursor.fetchall()  # Obtener los resultados
            if prestamos:
                prestamos_list = '\n'.join([f"ID: {p[0]}, Libro: {p[1]}, Fecha de Préstamo: {p[2]}, Fecha de Devolución: {p[3]}" for p in prestamos])
                messages.success(request, f"Préstamos del usuario {id_usuario}:\n{prestamos_list}")
            else:
                messages.warning(request, f"El usuario {id_usuario} no tiene préstamos.")
            return HttpResponse("Consulta realizada.")
    except Exception as e:
        messages.error(request, f"Error al consultar los préstamos: {str(e)}")
        return HttpResponse(f"Error: {str(e)}")


def registrar_libro(request):
    if request.method == 'POST':
        form = RegistrarLibroForm(request.POST)
        if form.is_valid():
            id_libro = form.cleaned_data['id_libro']
            nomb_libro = form.cleaned_data['nomb_libro']
            editorial = form.cleaned_data['editorial']
            isbn = form.cleaned_data['isbn']
            num_paginas = form.cleaned_data['num_paginas']
            id_autor = form.cleaned_data['id_autor']
            id_genero = form.cleaned_data['id_genero']
            
            # Llamada al procedimiento almacenado
            try:
                with connection.cursor() as cursor:
                    cursor.callproc('RegistrarLibro', [id_libro, nomb_libro, editorial, isbn, num_paginas, id_autor, id_genero])
                messages.success(request, "Libro registrado correctamente.")
            except Exception as e:
                messages.error(request, f"Error al registrar el libro: {str(e)}")
                
            return HttpResponseRedirect('/admin/')  # Redirigir al admin
    else:
        form = RegistrarLibroForm()
    return render(request, 'admin/registrar_libro.html', {'form': form})


def realizar_prestamo(request):
    if request.method == 'POST':
        form = RealizarPrestamoForm(request.POST)
        if form.is_valid():
            id_usuario = form.cleaned_data['id_usuario']
            id_libro = form.cleaned_data['id_libro']
            fecha_prestamo = form.cleaned_data['fecha_prestamo']
            dias_prestamo = form.cleaned_data['dias_prestamo']
            fecha_devuelto = form.cleaned_data['fecha_devuelto']
            
            # Llamada al procedimiento almacenado
            try:
                with connection.cursor() as cursor:
                    cursor.callproc('RealizarPrestamo', [id_usuario, id_libro, fecha_prestamo, dias_prestamo, fecha_devuelto])
                messages.success(request, "Préstamo realizado correctamente.")
            except Exception as e:
                messages.error(request, f"Error al realizar el préstamo: {str(e)}")
                
            return HttpResponseRedirect('/admin/')  # Redirigir al admin
    else:
        form = RealizarPrestamoForm()
    return render(request, 'admin/realizar_prestamo.html', {'form': form})
