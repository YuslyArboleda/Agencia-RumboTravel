# Generated by Django 5.1 on 2024-10-19 00:21

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Acomodacion',
            fields=[
                ('id_acomodacion', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=300)),
                ('descripcion', models.TextField()),
                ('capacidad', models.IntegerField()),
                ('estado', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Adicion',
            fields=[
                ('id_adicion', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=20)),
                ('descripcion', models.TextField()),
                ('costo', models.FloatField()),
                ('estado', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Destino',
            fields=[
                ('id_destino', models.AutoField(primary_key=True, serialize=False)),
                ('destino', models.CharField(max_length=200)),
                ('estado', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Paquete',
            fields=[
                ('id_paquete', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=200)),
                ('descripcion', models.TextField()),
                ('vigencia_inicio', models.DateField()),
                ('vigencia_fin', models.DateField()),
                ('noche', models.IntegerField()),
                ('incluye', models.TextField()),
                ('no_incluye', models.TextField()),
                ('costo', models.FloatField()),
                ('disponibilidad', models.CharField(max_length=50)),
                ('imagen', models.ImageField(blank=True, null=True, upload_to='assets/img')),
                ('estado', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id_cliente', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=200)),
                ('tipo_doc', models.CharField(max_length=20)),
                ('documento', models.CharField(max_length=20, unique=True)),
                ('telefono', models.CharField(max_length=20)),
                ('correo', models.CharField(max_length=200)),
                ('direccion', models.CharField(max_length=50)),
                ('estado', models.IntegerField(default=1)),
                ('id_destino', models.ForeignKey(db_column='id_destino', on_delete=django.db.models.deletion.PROTECT, to='viajes.destino')),
            ],
        ),
        migrations.CreateModel(
            name='Hospedaje',
            fields=[
                ('id_hospedaje', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=100)),
                ('direccion', models.CharField(max_length=50)),
                ('correo', models.CharField(max_length=30)),
                ('tipo_hospedaje', models.CharField(max_length=30)),
                ('descripcion', models.TextField()),
                ('telefono', models.CharField(max_length=50)),
                ('tarifa_base', models.FloatField()),
                ('estado', models.IntegerField(default=1)),
                ('imagen', models.ImageField(blank=True, null=True, upload_to='assets/img')),
                ('id_destino', models.ForeignKey(db_column='id_destino', on_delete=django.db.models.deletion.PROTECT, to='viajes.destino')),
            ],
        ),
        migrations.CreateModel(
            name='HospedajeAcomodacion',
            fields=[
                ('id_hospedaje_acomodacion', models.AutoField(primary_key=True, serialize=False)),
                ('temporada', models.CharField(max_length=20)),
                ('tarifa_agencia', models.FloatField()),
                ('tarifa', models.FloatField()),
                ('imagen', models.ImageField(blank=True, null=True, upload_to='assets/img')),
                ('id_acomodacion', models.ForeignKey(db_column='id_acomodacion', on_delete=django.db.models.deletion.PROTECT, to='viajes.acomodacion')),
                ('id_hospedaje', models.ForeignKey(db_column='id_hospedaje', on_delete=django.db.models.deletion.PROTECT, to='viajes.hospedaje')),
            ],
        ),
        migrations.CreateModel(
            name='PaqueteTour',
            fields=[
                ('id_paquete_tour', models.AutoField(primary_key=True, serialize=False)),
                ('id_hospedaje_acomodacion', models.ForeignKey(db_column='id_hospedaje_acomodacion', on_delete=django.db.models.deletion.PROTECT, to='viajes.hospedajeacomodacion')),
                ('id_paquete', models.ForeignKey(db_column='id_paquete', on_delete=django.db.models.deletion.PROTECT, to='viajes.paquete')),
            ],
        ),
        migrations.CreateModel(
            name='Reserva',
            fields=[
                ('id_reserva', models.AutoField(primary_key=True, serialize=False)),
                ('fecha', models.DateField()),
                ('fecha_inicio', models.DateField()),
                ('fecha_fin', models.DateField()),
                ('cantidad', models.IntegerField()),
                ('total', models.FloatField()),
                ('estado_reserva', models.CharField(max_length=20)),
                ('metodo_pago', models.CharField(max_length=20)),
                ('estado', models.IntegerField(default=1)),
                ('id_cliente', models.ForeignKey(db_column='id_cliente', on_delete=django.db.models.deletion.PROTECT, to='viajes.cliente')),
            ],
        ),
        migrations.CreateModel(
            name='DetalleReserva',
            fields=[
                ('id_detalle_reserva', models.AutoField(primary_key=True, serialize=False)),
                ('habitaciones', models.IntegerField()),
                ('adulto', models.IntegerField()),
                ('infante', models.IntegerField()),
                ('comentarios', models.CharField(blank=True, max_length=500, null=True)),
                ('id_acomodacion', models.ForeignKey(blank=True, db_column='id_acomodacion', null=True, on_delete=django.db.models.deletion.PROTECT, to='viajes.acomodacion')),
                ('id_adicion', models.ForeignKey(blank=True, db_column='id_adicion', null=True, on_delete=django.db.models.deletion.PROTECT, to='viajes.adicion')),
                ('id_paquete_tour', models.ForeignKey(blank=True, db_column='id_paquete_tour', null=True, on_delete=django.db.models.deletion.PROTECT, to='viajes.paquetetour')),
                ('id_reserva', models.ForeignKey(db_column='id_reserva', on_delete=django.db.models.deletion.PROTECT, to='viajes.reserva')),
            ],
        ),
    ]