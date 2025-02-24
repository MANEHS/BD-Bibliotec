from django.db import models

# Create your models here.


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
    
    def __str__ (self): 
        return "{}".format(self.nom_autor) 



class AutorLibro(models.Model):
    id_autor = models.OneToOneField(Autor, models.DO_NOTHING, db_column='id_autor', primary_key=True)  # The composite primary key (id_autor, id_libro) found, that is not supported. The first column is selected.
    id_libro = models.ForeignKey('Libro', models.DO_NOTHING, db_column='id_libro')

    class Meta:
        managed = False
        db_table = 'autor_libro'
        unique_together = (('id_autor', 'id_libro'),)

    def __str__ (self): 
        return "{}".format(self.id_autor) 


class Genero(models.Model):
    id_genero = models.AutoField(primary_key=True)
    nombre_genero = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'genero'

    def __str__ (self): 
        return "{}".format(self.nombre_genero) 


class Libro(models.Model):
    id_libro = models.AutoField(primary_key=True)
    nomb_libro = models.CharField(max_length=40)
    editorial = models.CharField(max_length=40)
    isbn = models.CharField(max_length=20)
    num_paginas = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'libro'
        
    def __str__ (self): 
        return "{}".format(self.nomb_libro) 


class LibroGenero(models.Model):
    id_libro = models.OneToOneField(Libro, models.DO_NOTHING, db_column='id_libro', primary_key=True)  # The composite primary key (id_libro, id_genero) found, that is not supported. The first column is selected.
    id_genero = models.ForeignKey(Genero, models.DO_NOTHING, db_column='id_genero')

    class Meta:
        managed = False
        db_table = 'libro_genero'
        unique_together = (('id_libro', 'id_genero'),)

    def __str__ (self): 
        return "{}".format(self.id_libro) 


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
    
    def __str__ (self): 
        return "{}".format(self.estado) 


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
    
    def __str__ (self): 
        return "{}".format(self.nom) 
