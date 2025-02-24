# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Autor(models.Model):
    id_autor = models.AutoField(primary_key=True)
    nom_autor = models.CharField(max_length=20)
    apellido_p = models.CharField(max_length=20)
    apellido_m = models.CharField(max_length=20)
    fecha_nacimiento = models.DateField()
    fecha_muerte = models.DateField(blank=True, null=True)
    nacionalidad = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'autor'


class AutorLibro(models.Model):
    id_autor = models.OneToOneField(Autor, models.DO_NOTHING, db_column='id_autor', primary_key=True)  # The composite primary key (id_autor, id_libro) found, that is not supported. The first column is selected.
    id_libro = models.ForeignKey('Libro', models.DO_NOTHING, db_column='id_libro')

    class Meta:
        managed = False
        db_table = 'autor_libro'
        unique_together = (('id_autor', 'id_libro'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Genero(models.Model):
    id_genero = models.AutoField(primary_key=True)
    nombre_genero = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'genero'


class Libro(models.Model):
    id_libro = models.AutoField(primary_key=True)
    nomb_libro = models.CharField(max_length=40)
    editorial = models.CharField(max_length=40)
    isbn = models.CharField(max_length=20)
    num_paginas = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'libro'


class LibroGenero(models.Model):
    id_libro = models.OneToOneField(Libro, models.DO_NOTHING, db_column='id_libro', primary_key=True)  # The composite primary key (id_libro, id_genero) found, that is not supported. The first column is selected.
    id_genero = models.ForeignKey(Genero, models.DO_NOTHING, db_column='id_genero')

    class Meta:
        managed = False
        db_table = 'libro_genero'
        unique_together = (('id_libro', 'id_genero'),)


class Prestamo(models.Model):
    id_prestamo = models.AutoField(primary_key=True)
    fecha_prestamo = models.DateField()
    dias_prestamo = models.IntegerField()
    fecha_devuelto = models.DateField()
    estado = models.CharField(max_length=10)
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_usuario')
    id_libro = models.ForeignKey(Libro, models.DO_NOTHING, db_column='id_libro')

    class Meta:
        managed = False
        db_table = 'prestamo'


class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    direccion = models.CharField(max_length=30)
    correo = models.CharField(max_length=30)
    nom = models.CharField(max_length=20)
    ap_map = models.CharField(max_length=20)
    ap_pat = models.CharField(max_length=20)
    telefono = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'usuario'
