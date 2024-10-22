from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage  # Import these
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
    queryset = Acomodacion.objects.all()
    serializer_class = AcomodacionSerializer
    
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

def index(request):
    return render(request, "index.html")

def buscar_destino(request):
    query = request.GET.get("q", "")
    print(query)
    if query: 
        with connection.cursor() as cursor:
            cursor.callproc("cons_destino", [query]) # Llama al procedimiento almacenado 'cons_destino' con 'query' como parámetro.
            resultados = cursor.fetchall() # Recupera todos los resultados devueltos por el procedimiento almacenado.
            columns = [col[0] for col in cursor.description] # Obtiene los nombres de las columnas del resultado.
            resultado_dict = [dict(zip(columns, row)) for row in resultados] # Combina las columnas y los datos en diccionarios, creando una lista de diccionarios.
        return JsonResponse(resultado_dict, safe=False) # Devuelve la lista de resultados como una respuesta JSON.
    return JsonResponse([], safe=False)

def consultar_paquete(request):
    query = request.GET.get("q", "")
    print("Ingresó a la consulta")
    print(f"Query recibido: {query}")
    resultado_dict = []
    if query:
        try:
            with connection.cursor() as cursor:
                cursor.callproc("consulta_pa_tour", [query])
                resultados = cursor.fetchall()
                columns = [col[0] for col in cursor.description]
                resultado_dict = [dict(zip(columns, row)) for row in resultados]
                paginator = Paginator(resultado_dict, 3)  # Paginator initialized here
                page = request.GET.get('page', 1)  # Get the page number from the request
                try:
                    paquetes = paginator.page(page)
                except PageNotAnInteger:
                    paquetes = paginator.page(1)
                except EmptyPage:
                    paquetes = paginator.page(paginator.num_pages)
                return render(
                    request,
                    "HTML/Paquete1.html",
                    {
                        "resultados": paquetes,
                        "query": query,
                    },
                )

        except Exception as e:
            # Debugging the error
            print(f"Error al ejecutar el procedimiento almacenado: {e}")
            return JsonResponse({"error": str(e)}, status=500)
    else:
        return render(request, "HTML/Paquete1.html", {"resultados": []})

def detalle_paquete (request):
    query = request.GET.get("q", "")
    print("Ingresó a la consulta")
    print(f"Query recibido: {query}")
    resultado_dict = []

    if query:
        try:
            with connection.cursor() as cursor:
                cursor.callproc("detalle_paqute_tour", [query])
                resultados = cursor.fetchall()
                columns = [col[0] for col in cursor.description]
                resultado_dict = [dict(zip(columns, row)) for row in resultados]

                return render(
                    request,
                    "html/detallepaquete.html",
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
        return render(request, "html/detallepaquete.html", {"resultados": []})

def obtenerhospAcomodacion(request):
    query = request.GET.get("q", "")
    if query:
        try:
            acomodaciones = HospedajeAcomodacion.objects.filter(
            id_hospedaje_acomodacion=query
        ).values("id_acomodacion", "tarifa")
            return JsonResponse(list(acomodaciones), safe=False)
        except Exception as e:
            print(f"Error al ejecutar el procedimiento almacenado: {e}")
            return JsonResponse({"error ": str(e)}, status=500)

def hospacomodacion (request):
    query = request.GET.get("q")
    try:
        acomodaciones = HospedajeAcomodacion.objects.filter(
            id_hospedaje=query
        ).values("id_hospedaje_acomodacion", "tarifa", "id_acomodacion__nombre")
        return JsonResponse(list(acomodaciones), safe=False)
    except Exception as e:
        print(f"Error: {str(e)}")  # Log del error para depuración
        return JsonResponse({"error": "Error interno del servidor"}, status=500)
        