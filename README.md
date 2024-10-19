# Proyecto_Agencia
- pip install django
- pip install mysql-connector-python
- pip install mysqlclient
- pip install django djangorestframework
  
# Crear proyecto
- django-admin startproject nombredelproyecto
- cd nombredelproyecto
- python manage.py startapp nombredelaApp

## Realizar las migraciones

- python manage.py inspectdb > viajes/models.py
- python manage.py migrate
- python manage.py makemigrations

## Crear maquina Virtual 
- python -m venv env
- env\Scripts\activate



