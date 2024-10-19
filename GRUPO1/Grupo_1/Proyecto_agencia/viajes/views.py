from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

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

from .serializers import (
    AcomodacionSerializer,
    ClienteSerializer,
    DestinoSerializer,
    HospedajeSerializer,
    HospedajeAcomodacionSerializer,
    PaqueteSerializer,
    AdicionSerializer,
    PaqueteTourSerializer,
    DetalleReservaSerializer,
    ReservaSerializer,
)

from rest_framework import viewsets

class AcomodacionViewSet(viewsets.ModelViewSet):
    queryset = Acomodacion.objects.all() #trae todo lo de la base de datos de la tabla acomodacion
    serializer_class = AcomodacionSerializer # trae todo lo generado de los serialiazer ej: inner join

class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

class DestinoViewSet(viewsets.ModelViewSet):
    queryset = Destino.objects.all()
    serializer_class = DestinoSerializer

class ReservaViewSet(viewsets.ModelViewSet):
    queryset = Reserva.objects.all()
    serializer_class = ReservaSerializer

class HospedajeAcomodacionViewSet(viewsets.ModelViewSet):
    queryset = HospedajeAcomodacion.objects.all()
    serializer_class = HospedajeAcomodacionSerializer

class PaqueteViewSet(viewsets.ModelViewSet):
    queryset = Paquete.objects.all()
    serializer_class = PaqueteSerializer

class HospedajeViewSet(viewsets.ModelViewSet):
    queryset = Hospedaje.objects.all()
    serializer_class = HospedajeSerializer

class PaqueteTourViewSet(viewsets.ModelViewSet):
    queryset = PaqueteTour.objects.all()
    serializer_class = PaqueteTourSerializer

class AdicionViewSet(viewsets.ModelViewSet):
    queryset = Adicion.objects.all()
    serializer_class = AdicionSerializer

class DetalleReservaViewSet(viewsets.ModelViewSet):
    queryset = DetalleReserva.objects.all()
    serializer_class = DetalleReservaSerializer

def index(request): # metodo que Hace que la pagina principal cargue
    return render(request, "index.html") # redner direcciona 

def buscar_destino(request):
    query = request.GET.get("q","") #informacion de trae la data, misma letra del ajax
    if query:
        with connection.cursor() as cursor: # cursor metodo de la clase connecion
            cursor.callproc("consultar_destino", [query]) #Callproc llama al procedimiento de la base de datos que requiere un valor el cual esta en la query
            resultados = cursor.fetchall() #fetchall es un arreglo
            columns = [col[0] for col in cursor.description] 
            resultado_dict = [dict(zip(columns, row)) for row in resultados]       
        return JsonResponse (resultado_dict, safe=False)
    return JsonResponse([], safe=False)

def detalle_paquete(request):
    query = request.GET.get("q", "")
    resultado_dict = []

    if query:
        try:
            with connection.cursor() as cursor:
                cursor.callproc("consultar_detalle_paquete", [query])
                resultados = cursor.fetchall()
                columns = [col[0] for col in cursor.description]
                resultado_dict = [dict(zip(columns, row)) for row in resultados]

                return render(
                    request,
                    "html/detalle_paquete.html",
                    {
                        "resultados": resultado_dict,
                        "query": query,
                    },
                )
        except Exception as e:
            # Agregar depuración para el error
            print(f"Error al ejecutar el procedimiento almacenado: {e}")
            return JsonResponse({"error": str(e)}, status=500)
    else:
        return render(request, "html/detalle_paquete.html", {"resultados":[]})    
    
def buscar_paquete(request):
    query = request.GET.get("q", "")
    page = request.GET.get("page", 1)
    resultado_dict = []

    if query:
        try:
            with connection.cursor() as cursor:
                cursor.callproc("consultar_paquete_tour", [query])
                resultados = cursor.fetchall()
                columns = [col[0] for col in cursor.description]
                resultado_dict = [dict(zip(columns, row)) for row in resultados]
                paginator = Paginator(resultado_dict, 2)
                print(paginator.page(paginator.num_pages))
                try:
                    paquetes = paginator.page(page)
                except PageNotAnInteger:
                    paquetes = paginator.page(1)
                except EmptyPage:
                    paquetes = paginator.page(paginator.num_pages)
                return render(
                    request,
                    "html/ver_paquetes.html",
                    {
                        "resultados": paquetes,
                        "query": query,
                    },
                )
        except Exception as e:
            # Agregar depuración para el error
            print(f"Error al ejecutar el procedimiento almacenado: {e}")
            return JsonResponse({"error": str(e)}, status=500)
    else:
        return render(request, "html/ver_paquetes.html", {"resultados":[]}) 
       
def buscar_acomodacion(request):
    query = request.GET.get("q","") #informacion de trae la data, misma letra del ajax
    if query:       
        with connection.cursor() as cursor: # cursor metodo de la clase connecion
            cursor.callproc("consultar_acomodacion", [query]) #Callproc llama al procedimiento de la base de datos que requiere un valor el cual esta en la query
            resultados = cursor.fetchall() #fetchall es un arreglo
            columns = [col[0] for col in cursor.description] 
            resultado_dict = [dict(zip(columns, row)) for row in resultados]       
        return JsonResponse (resultado_dict, safe=False)
    return JsonResponse([], safe=False)

def detalles_reservas(request):
    query = request.GET.get("q", "")
    resultado_dict = []

    if query:
        try:
            with connection.cursor() as cursor:
                cursor.callproc("consultar_detalle_paquete", [query])
                resultados = cursor.fetchall()
                columns = [col[0] for col in cursor.description]
                resultado_dict = [dict(zip(columns, row)) for row in resultados]

                return render(
                    request,
                    "html/detalles_reservas.html",
                    {
                        "resultados": resultado_dict,
                        "query": query,
                    },
                )
        except Exception as e:
            # Agregar depuración para el error
            print(f"Error al ejecutar el procedimiento almacenado: {e}")
            return JsonResponse({"error": str(e)}, status=500)
    else:
        return render(request, "html/detalles_reservas.html", {"resultados":[]})  

def tarifa_hospedaje_acomodacion(request):
    query = request.GET.get("q")
    try:
        acomodaciones = HospedajeAcomodacion.objects.filter(
            id_hospedaje_acomodacion=query).values("id_acomodacion", "tarifa")
        return JsonResponse(list(acomodaciones), safe=False)
    except Exception as e:
        print(f"Error:{str(e)}") #log del error para depuracion
        return JsonResponse({"error":"Error interno del servidor"},500),

def acomodacion_hospedaje(request):
    query = request.GET.get("q")
    print('hospedaje',query)
    try:
        acomodaciones = HospedajeAcomodacion.objects.filter(
            id_hospedaje_acomodacion=query).values("id_hospedaje_acomodacion", "id_acomodacion", "id_acomodacion__nombre")
        return JsonResponse(list(acomodaciones), safe=False)
    except Exception as e:
        print(f"Error:{str(e)}") #log del error para depuracion
        return JsonResponse({"error":"Error interno del servidor"},500),

        

 
             