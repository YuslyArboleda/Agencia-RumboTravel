import re
from django import forms
from .models import PaqueteTour, Hospedaje, HospedajeAcomodacion

class PaqueteTourForm(forms.ModelForm):
    Hospedaje = forms.ModelChoiceField(
        queryset=None,  # Será asignado dinámicamente en el __init__
        required=True,
        label="Hospedaje",
    )

    Tarifa = forms.DecimalField(
        widget=forms.NumberInput(attrs={"placeholder": "Tarifa"})
    )

    class Meta:
        model = PaqueteTour
        fields = [
            "Hospedaje",
            "id_hospedaje_acomodacion",
            "id_paquete",
        ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Inicializamos los querysets
        self.fields["Hospedaje"].queryset = Hospedaje.objects.all().distinct()
        self.fields["id_hospedaje_acomodacion"].queryset = (
           HospedajeAcomodacion.objects.none()
        )

        # Detectamos múltiples Hospedajes enviados en los datos del formulario
        Hospedajes_ids = []

        for key in self.data.keys():
            clave = re.match(
                r"^Paquete-(\d+)-Hospedaje$", key
            )  # captura de cualquier entrada con el formato paquete-<número>-Hospedaje.
            if clave:
                Hospedaje_id = self.data.get(key)
                if Hospedaje_id:
                    Hospedajes_ids.append(
                        int(Hospedaje_id)
                    )  # Guardamos los IDs encontrados

        # Si hay múltiples Hospedajes, ajustamos los querysets correspondientes
        if Hospedajes_ids:
            self.fields["id_hospedaje_acomodacion"].queryset = (
                id_hospedaje_acomodacion.objects.filter(
                id_hospedaje__in=Hospedajes_ids
                )  # se agrega el operador __in asegura que se carguen todas las acomodaciones asociadas a los Hospedajes seleccionados.
            )

        # Si es edición, inicializamos con los valores existentes
        elif self.instance.pk:
            id_hospedaje_acomodacion = self.instance.id_hospedaje_acomodacion
            self.fields["Hospedaje"].initial = id_hospedaje_acomodacion.id_hospedaje
            self.fields["Tarifa"].initial = id_hospedaje_acomodacion.tarifa_agencia
            self.fields["id_hospedaje_acomodacion"].queryset = (
                HospedajeAcomodacion.objects.filter(
                    id_hospedaje=id_hospedaje_acomodacion.id_hospedaje
                )
            )