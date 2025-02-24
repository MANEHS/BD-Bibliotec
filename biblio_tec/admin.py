from django.contrib import admin
from django.urls import path
from django.db import IntegrityError
from django.contrib import messages
from .models import *
from .views import backup_database, restore_database

from django.http import HttpResponseRedirect
from django.urls import reverse
from .views import consultar_prestamos

# Sitio de administración personalizado
class CustomAdminSite(admin.AdminSite):
    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('backup-db/', self.admin_view(backup_database), name='backup-db'),
            path('restore-db/', self.admin_view(restore_database), name='restore-db'),
        ]
        return custom_urls + urls

admin_site = CustomAdminSite(name='custom_admin')
admin.site = admin_site

# Función personalizada para eliminar libros
@admin.action(description="Eliminar libro")
def eliminar_libro_action(modeladmin, request, queryset):
    for libro in queryset:
        try:
            libro.delete()
            messages.success(request, f"El libro '{libro.nomb_libro}' se eliminó correctamente.")
        except IntegrityError as e:
            # Capturamos el error completo para entender mejor qué pasa
            messages.error(request, f"Error al eliminar el libro '{libro.nomb_libro}': {e}")
        except Exception as e:
            # Captura cualquier otro tipo de error
            messages.error(request, f"Ocurrió un error inesperado al eliminar el libro '{libro.nomb_libro}': {e}")


# Función personalizada para eliminar usuarios
@admin.action(description="Eliminar usuario")
def eliminar_usuario_action(modeladmin, request, queryset):
    for usuario in queryset:
        try:
            usuario.delete()
            messages.success(request, f"El usuario '{usuario.nom}' se eliminó correctamente.")
        except IntegrityError as e:
            # Verificamos si el error está relacionado con un trigger
            if "TRIGGER" in str(e):
                messages.error(request, f"Trigger activado: No se puede eliminar el usuario '{usuario.nom}' porque tiene préstamos activos.")
            else:
                messages.error(request, f"Error al eliminar el usuario '{usuario.nom}': {e}")
        except Exception as e:
            # Capturamos cualquier otro error inesperado
            messages.error(request, f"Ocurrió un error inesperado al eliminar el usuario '{usuario.nom}': {e}")

@admin.action(description="Consultar préstamos de un usuario")
def consultar_prestamos_action(modeladmin, request, queryset):
    for usuario in queryset:
        user_id = usuario.id_usuario
        return HttpResponseRedirect(reverse('consultar_prestamos', args=[user_id]))  # Redirige a la vista que llama al procedimiento


# Configuración personalizada de los modelos
class LibrosBiblio_Tec(admin.ModelAdmin):
    list_display = ["id_libro", "nomb_libro", "isbn"]
    search_fields = ["id_libro", "nomb_libro", "isbn"]
    ordering = ("id_libro", "nomb_libro")
    list_editable = ("nomb_libro", "isbn")
    list_filter = ("id_libro",)
    list_per_page = 3

    actions = [eliminar_libro_action]


class PrestamoBiblio_Tec(admin.ModelAdmin):
    list_display = ["id_prestamo", "fecha_devuelto", "estado"]
    search_fields = ["id_prestamo", "fecha_devuelto", "estado"]
    ordering = ("id_prestamo", "fecha_devuelto")
    list_editable = ("fecha_devuelto", "estado")
    list_filter = ("id_prestamo",)
    list_per_page = 3


class AutorBiblio_Tec(admin.ModelAdmin):
    list_display = ["id_autor", "nom_autor", "nacionalidad"]
    search_fields = ["id_autor", "nom_autor", "nacionalidad"]
    ordering = ("id_autor", "nom_autor")
    list_editable = ("nom_autor", "nacionalidad")
    list_filter = ("id_autor",)
    list_per_page = 3


class AutorLibroBiblio_Tec(admin.ModelAdmin):
    list_display = ["id_autor", "id_libro"]
    search_fields = ["id_autor", "id_libro"]
    ordering = ("id_autor", "id_libro")
    list_filter = ("id_autor",)
    list_per_page = 3


class GeneroBiblio_Tec(admin.ModelAdmin):
    list_display = ["id_genero", "nombre_genero"]
    search_fields = ["id_genero", "nombre_genero"]
    ordering = ("id_genero", "nombre_genero")
    list_filter = ("id_genero",)
    list_per_page = 3


class LibrosGeneroBiblio_Tec(admin.ModelAdmin):
    list_display = ["id_libro", "id_genero"]
    search_fields = ["id_libro", "id_genero"]
    ordering = ("id_libro", "id_genero")
    list_filter = ("id_libro",)
    list_per_page = 3


class UsiariosBiblio_Tec(admin.ModelAdmin):
    list_display = ["id_usuario", "nom", "telefono"]
    search_fields = ["id_usuario", "nom", "telefono"]
    ordering = ("id_usuario", "nom")
    list_editable = ("nom", "telefono")
    list_filter = ("id_usuario",)
    list_per_page = 3

    actions = [eliminar_usuario_action, consultar_prestamos_action]


# Registro de modelos con configuraciones personalizadas
admin.site.site_header = "Sistema BTM"
admin.site.site_title = "BTM"
admin.site.index_title = "Admon BTM"

admin.site.register(Autor, AutorBiblio_Tec)
admin.site.register(AutorLibro, AutorLibroBiblio_Tec)
admin.site.register(Genero, GeneroBiblio_Tec)
admin.site.register(Libro, LibrosBiblio_Tec)  # Solo aquí lo registramos
admin.site.register(LibroGenero, LibrosGeneroBiblio_Tec)
admin.site.register(Prestamo, PrestamoBiblio_Tec)
admin.site.register(Usuario, UsiariosBiblio_Tec)
