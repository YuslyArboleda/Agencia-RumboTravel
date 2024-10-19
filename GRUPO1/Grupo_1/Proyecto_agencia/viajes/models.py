from django.db import models

class Acomodacion(models.Model):
    id_acomodacion = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=300)
    descripcion = models.TextField()
    capacidad = models.IntegerField()
    estado = models.IntegerField(default=1)
    def __str__(self):
        return self.nombre 

class Adicion(models.Model):
    id_adicion = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=20)
    descripcion = models.TextField()
    costo = models.FloatField()
    estado = models.IntegerField(default=1)
    def __str__(self):
        return self.nombre + " - " + self.descripcion

class Cliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200)
    tipo_doc = models.CharField(max_length=20)
    documento = models.CharField(unique=True, max_length=20)
    telefono = models.CharField(max_length=20)
    correo = models.CharField(max_length=200)
    direccion = models.CharField(max_length=50)
    id_destino = models.ForeignKey('Destino', models.PROTECT, db_column='id_destino')
    estado = models.IntegerField(default=1)
    def __str__(self):
        return self.nombre + " - " + self.tipo_doc + " - " + self.documento 

class Destino(models.Model):
    id_destino = models.AutoField(primary_key=True)
    destino = models.CharField(max_length=200)
    estado = models.IntegerField(default=1)
    def __str__(self):
        return self.destino

class DetalleReserva(models.Model):
    id_detalle_reserva = models.AutoField(primary_key=True)
    id_reserva = models.ForeignKey('Reserva', models.PROTECT, db_column='id_reserva')
    id_paquete_tour = models.ForeignKey('PaqueteTour', models.PROTECT, db_column='id_paquete_tour', blank=True, null=True)
    id_acomodacion = models.ForeignKey(Acomodacion, models.PROTECT, db_column='id_acomodacion', blank=True, null=True)
    id_adicion = models.ForeignKey(Adicion, models.PROTECT, db_column='id_adicion', blank=True, null=True)
    habitaciones = models.IntegerField()
    adulto = models.IntegerField()
    infante = models.IntegerField()
    comentarios = models.CharField(max_length=500, blank=True, null=True)
    def __str__(self):
        return f"{self.id_reserva} - {self.id_paquete_tour} - con adiciones de: {self.id_adicion} - Habitaciones {self.habitaciones} - Adultos {self.adulto} - Ninos {self.infante}"

class Hospedaje(models.Model):
    id_hospedaje = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    direccion = models.CharField(max_length=50)
    correo = models.CharField(max_length=30)
    tipo_hospedaje = models.CharField(max_length=30)
    descripcion = models.TextField()
    telefono = models.CharField(max_length=50)
    tarifa_base = models.FloatField()
    id_destino = models.ForeignKey(Destino, models.PROTECT, db_column='id_destino')
    estado = models.IntegerField(default=1)
    imagen = models.ImageField(upload_to="assets/img",blank=True,null=True)
    def __str__(self):
        return self.tipo_hospedaje + " - " + self.nombre 

class HospedajeAcomodacion(models.Model):
    id_hospedaje_acomodacion = models.AutoField(primary_key=True)
    id_acomodacion = models.ForeignKey(Acomodacion, models.PROTECT, db_column='id_acomodacion')
    id_hospedaje = models.ForeignKey(Hospedaje, models.PROTECT, db_column='id_hospedaje')
    temporada = models.CharField(max_length=20)
    tarifa_agencia = models.FloatField()
    tarifa = models.FloatField()
    imagen = models.ImageField(upload_to="assets/img",blank=True,null=True)
    def __str__(self):
        return f"{self.id_acomodacion}"
    
class Paquete(models.Model):
    id_paquete = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=200)
    descripcion = models.TextField()
    vigencia_inicio = models.DateField()
    vigencia_fin = models.DateField()
    noche = models.IntegerField()
    incluye = models.TextField()
    no_incluye = models.TextField()
    costo = models.FloatField()
    disponibilidad = models.CharField(max_length=50)
    imagen = models.ImageField(upload_to="assets/img",blank=True,null=True)
    estado = models.IntegerField(default=1)
    def __str__(self):
        return self.nombre

class PaqueteTour(models.Model):
    id_paquete_tour = models.AutoField(primary_key=True)
    id_paquete = models.ForeignKey(Paquete, models.PROTECT, db_column='id_paquete')
    id_hospedaje_acomodacion = models.ForeignKey('HospedajeAcomodacion', models.PROTECT, db_column='id_hospedaje_acomodacion')
    # def __str__(self):
    #     return f"{self.id_paquete__nombre} "
    

class Reserva(models.Model):
    id_reserva = models.AutoField(primary_key=True)
    fecha = models.DateField()
    fecha_inicio = models.DateField()
    fecha_fin = models.DateField()
    cantidad = models.IntegerField()
    total = models.FloatField()
    estado_reserva = models.CharField(max_length=20)
    metodo_pago = models.CharField(max_length=20)
    id_cliente = models.ForeignKey('Cliente', models.PROTECT, db_column='id_cliente')
    estado = models.IntegerField(default=1)
    def __str__(self):
        return f"{self.id_cliente} con fecha de reserva {self.fecha} para {self.cantidad} personas por un total de {self.total}"
    
