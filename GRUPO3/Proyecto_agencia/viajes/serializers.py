from rest_framework import serializers
from .models import(
    Acomodacion,
    Reserva,
    Cliente,
    Destino,
    Hospedaje,
    HospedajeAcomodacion,
    Paquete,
    PaqueteTour,
    Adicion,
    DetalleReserva,
)

class AcomodacionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Acomodacion
        fields = "__all__"

class ReservaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reserva
        fields = "__all__"

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = "__all__"

class DestinoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Destino
        fields = "__all__"

class HospedajeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hospedaje
        fields = "__all__"

class HospedajeAcomodacionSerializer(serializers.ModelSerializer):
    class Meta:
        model = HospedajeAcomodacion
        fields = "__all__"

class PaqueteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paquete
        fields = "__all__"

class PaqueteTourSerializer(serializers.ModelSerializer):
    class Meta:
        model = PaqueteTour
        fields = "__all__"

class AdicionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Adicion
        fields = "__all__"

class DetalleReservaSerializer(serializers.ModelSerializer):
    class Meta:
        model = DetalleReserva
        fields = "__all__"