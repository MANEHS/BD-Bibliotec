from django.core.management.base import BaseCommand
import os
from django.conf import settings

class Command(BaseCommand):
    help = 'Restaurar la base de datos desde un archivo de respaldo'

    def handle(self, *args, **kwargs):
        # Ruta del archivo de respaldo más reciente
        backup_dir = os.path.join(settings.BASE_DIR, 'backups')
        backups = [f for f in os.listdir(backup_dir) if f.endswith('.sql')]

        if not backups:
            self.stdout.write(self.style.ERROR("No hay respaldos disponibles para restaurar."))
            return

        backup_file = os.path.join(backup_dir, max(backups, key=lambda f: os.path.getmtime(os.path.join(backup_dir, f))))

        # Comando de restauración
        command = f'mysql -u {settings.DATABASES["default"]["USER"]} -p{settings.DATABASES["default"]["PASSWORD"]} {settings.DATABASES["default"]["NAME"]} < {backup_file}'

        self.stdout.write(f"Restaurando base de datos desde {backup_file}...")

        try:
            result = os.system(command)
            if result == 0:
                self.stdout.write(self.style.SUCCESS(f"Base de datos restaurada desde {backup_file}."))
            else:
                self.stdout.write(self.style.ERROR("Error al ejecutar el comando de restauración."))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f"Error: {str(e)}"))
