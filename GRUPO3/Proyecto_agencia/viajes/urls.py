from django.urls import path, include
from rest_framework import routers
from viajes import views

routers = routers.DefaultRouter()

routers.register(r"acomodacion", views.AcomodacionViewSet)
routers.register(r"reserva", views.ReservaViewSet)
routers.register(r"detalle_reserva", views.DetalleReservaViewSet)
routers.register(r"cliente", views.ClienteViewSet)
routers.register(r"paquete", views.PaqueteViewSet)
routers.register(r"paquete_tur", views.PaqueteTourViewSet)
routers.register(r"destino", views.DestinoViewSet)
routers.register(r"adicion", views.AdicionViewSet)
routers.register(r"hospedaje", views.HospedajeViewSet)
routers.register(r"hospedaje_Acomodacion", views.HospedajeAcomodacionViewSet)

urlpatterns = [
    path("rumbotravel/", include(routers.urls)),
    path("", views.index, name="index"),
    path("buscar_destino", views.buscar_destino, name="buscar_destino"),
    path("consultar_paquete", views.consultar_paquete, name="consultar_paquete"),
    path("detalle_paquete", views.detalle_paquete, name="detalle_paquete"),
    path("hospacomodacion", views.hospacomodacion, name="hospacomodacion"),
    path("obtenerhospAcomodacion", views.obtenerhospAcomodacion, name="obtenerhospAcomodacion"),
]
