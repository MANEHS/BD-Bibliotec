import os
from django.core.management.base import BaseCommand
from django.conf import settings
import datetime

class Command(BaseCommand):
    help = 'Respaldar la base de datos'

    def handle(self, *args, **kwargs):
        # Define el nombre del archivo de respaldo
        backup_dir = os.path.join(settings.BASE_DIR, 'backups')
        os.makedirs(backup_dir, exist_ok=True)
        timestamp = datetime.datetime.now().strftime('%Y%m%d_%H%M%S')
        backup_file = os.path.join(backup_dir, f'backup_{timestamp}.sql')

        # Ejecutar el comando para respaldar
        os.system(f'mysqldump -u {settings.DATABASES["default"]["USER"]} -p{settings.DATABASES["default"]["PASSWORD"]} {settings.DATABASES["default"]["NAME"]} > {backup_file}')
        self.stdout.write(f"Respaldo creado en {backup_file}")
