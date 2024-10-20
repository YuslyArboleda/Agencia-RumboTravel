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
        js=("js/jquery-3.7.1.min.js", "js/paquete.js")#agregue la clase de jquery del index al admin, el archivo admin dinamica

class HospedajeAcomodacionInline(admin.TabularInline):
    model= HospedajeAcomodacion #nombre del modelo donde se va a guardar la informacion
    extra=1 #nos indica que al menos debe haber un registro

class HospedajeAdmin(BaseAdmin): #se registra en el modelo          
    inlines= [HospedajeAcomodacionInline]
    list_display = ('nombre','direccion') #filtros
    search_fields = ('nombre','direccion')

class PaqueteTourInline(admin.TabularInline): #la tabla que voy ha asociar
    model= PaqueteTour #nombre del modelo donde se va a guardar la informacion
    extra=1 #nos indica que al menos debe haber un registro
    form=PaqueteTourForm

class PaqueteAdmin(BaseAdmin): #se registra en el modelo
    inlines= [PaqueteTourInline] #asociacion de la tabla con el paquete
    list_display = ('nombre', 'vigencia_inicio', 'costo')
    search_fields = ('nombre', 'vigencia_inicio', 'costo') #muestra un buscador para buscar

class AcomodacionAdmin(BaseAdmin):
    list_display = ('nombre', 'capacidad') #muestra una lista de lo que puedo buscar
    search_fields = ('nombre', 'capacidad') #muestra un buscador para buscar

class ClienteAdmin(BaseAdmin):
    list_display = ('nombre', 'tipo_doc', 'documento', 'telefono') #muestra una lista de lo que puedo buscar
    search_fields = ('nombre', 'tipo_doc', 'documento','telefono')

class DestinoAdmin(BaseAdmin):
    list_display = ('destino',) #muestra una lista de lo que puedo buscar
    search_fields = ('destino',)
    
class AdicionAdmin(BaseAdmin):
    list_display = ('nombre','descripcion',) #muestra una lista de lo que puedo buscar
    search_fields = ('nombre','descripcion',)


admin.site.register(Acomodacion, AcomodacionAdmin) #en los parentesis se registran los cambios
admin.site.register(Hospedaje, HospedajeAdmin)
#admin.site.register(HospedajeAcomodacion)
admin.site.register(Reserva)
admin.site.register(Cliente, ClienteAdmin)
admin.site.register(Destino, DestinoAdmin)
admin.site.register(DetalleReserva)      
admin.site.register(Adicion, AdicionAdmin)
#admin.site.register(PaqueteTour)
admin.site.register(Paquete, PaqueteAdmin) 