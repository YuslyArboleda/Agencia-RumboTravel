import re
from django import forms
from .models import PaqueteTour, Hospedaje, HospedajeAcomodacion


class PaqueteTourForm(forms.ModelForm):
    hospedaje = forms.ModelChoiceField( #modelo, modelchoicefield es para decirle que es un select SSS
        queryset=None,  # Será asignado dinámicamente en el __init__
        required=True,
        label="Hospedaje",
    )

    tarifa = forms.DecimalField( # solo numeros
        widget=forms.NumberInput(attrs={"placeholder": "Tarifa"})
    )

    class Meta: #para ubicarme en el modelo que necesito
        model = PaqueteTour
        fields = ["hospedaje","id_hospedaje_acomodacion","id_paquete",]
    
    def __init__(self, *args, **kwargs): #como va a arracar cuando le de click
        super().__init__(*args, **kwargs) #metodo constructor
        # Inicializamos los querysets, se obtiene toda la informacion
        self.fields["hospedaje"].queryset = Hospedaje.objects.all().distinct() 
        self.fields["id_hospedaje_acomodacion"].queryset = (
                HospedajeAcomodacion.objects.none()
        )

        # Detectamos múltiples hospedajes enviados en los datos del formulario
        hospedajes_ids = []
        for key in self.data.keys():
            clave = re.match(
                r"^paquetetour_set-(\d+)-hospedaje$", key
            )  # captura de cualquier entrada con el formato paquetetour-<número>-hospedaje.
            if clave:
                hospedaje_id = self.data.get(key)
                if hospedaje_id:
                    hospedajes_ids.append(
                        int(hospedaje_id)
                    )  # Guardamos los IDs encontrados
            # Si hay múltiples hospedajes, ajustamos los querysets correspondientes
        if hospedajes_ids:
            self.fields["id_hospedaje_acomodacion"].queryset = (
                HospedajeAcomodacion.objects.filter(
                    id_hospedaje__in=hospedajes_ids
                )  # se agrega el operador __in asegura que se carguen todas las acomodaciones asociadas a los hospedajes seleccionados.
            )

        # Si es edición, inicializamos con los valores existentes
        elif self.instance.pk:
            
            hospedaje_acomodacion = self.instance.id_hospedaje_acomodacion
            print("hospedaje_acomodacion", hospedaje_acomodacion)
            self.fields["hospedaje"].initial = hospedaje_acomodacion.id_hospedaje
            self.fields["tarifa"].initial = hospedaje_acomodacion.tarifa
            self.fields["id_hospedaje_acomodacion"].queryset = (
                HospedajeAcomodacion.objects.filter(
                    id_hospedaje=hospedaje_acomodacion.id_hospedaje
                )
            )