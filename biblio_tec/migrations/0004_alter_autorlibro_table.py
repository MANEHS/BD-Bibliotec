# Generated by Django 4.2.5 on 2024-10-23 21:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('biblio_tec', '0003_delete_authgroup_delete_authgrouppermissions_and_more'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='autorlibro',
            table='autor_libro',
        ),
    ]
