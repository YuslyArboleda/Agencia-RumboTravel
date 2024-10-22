from django.contrib import admin
from .forms import PaqueteTourForm
from .models import (
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


class BaseAdmin(admin.ModelAdmin):
    class Media:
        js = ("js/jquery-3.7.1.min.js", "js/paquete.js")

class DestinoAdmin(BaseAdmin):
    list_display = ('destino',)
    search_fields = ('destino',)
class AcomodacionAdmin(BaseAdmin):
    list_display = ('nombre', 'capacidad',)
    search_fields = ('nombre',)
class ClienteAdmin(BaseAdmin):
    list_display = ('nombre',)
    search_fields = ('nombre',)
class HospedajeAcomodacionInline(admin.TabularInline):
    model = HospedajeAcomodacion
    extra = 1
class HospedajeAdmin(BaseAdmin):
    inlines = [HospedajeAcomodacionInline]
class PaqueteTourInline(admin.TabularInline):
    model = PaqueteTour
    extra = 1
    form = PaqueteTourForm
class PaqueteAdmin(BaseAdmin):
    inlines = [PaqueteTourInline]
    list_display = ('nombre',)
    search_fields = ('nombre',)

# Registrar los modelos en el administrador de Django
admin.site.register(Acomodacion, AcomodacionAdmin)
admin.site.register(Hospedaje, HospedajeAdmin)
admin.site.register(Reserva)
admin.site.register(Cliente, ClienteAdmin)
admin.site.register(Destino, DestinoAdmin)
admin.site.register(DetalleReserva)
admin.site.register(Adicion)
admin.site.register(Paquete, PaqueteAdmin)
# admin.site.register(PaqueteTour)
# admin.site.register(HospedajeAcomodacion)