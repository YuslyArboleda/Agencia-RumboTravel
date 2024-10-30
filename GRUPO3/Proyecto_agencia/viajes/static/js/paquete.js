$(document).ready(function () { // lea el documento del html

    $(document).on("input", "input[id^='id_hospedajeacomodacion_set-'][id$='-tarifa_agencia']",
        function () {
            let tarifa_agencia = $(this);
            let id = tarifa_agencia.attr('id').match(/\d+/); //attr = traer todo lo que tiene y lo ubica match= coje la parte numerica de la informacion y para determinar el id
            let tarifa_hospedaje = $("#id_hospedajeacomodacion_set-" + id + "-tarifa");
            let tarifa = tarifa_agencia.val();
            tarifa_hospedaje.val((tarifa * 1.2).toFixed(0));
            console.log("tarifa_agencia", tarifa_agencia.val());
            console.log("tarifa_hospedaje", tarifa_hospedaje.val());
        }
    );


    // 1  id="id_paquetetour_set-0-Hospedaje"
    // 2  id="id_paquetetour_set-0-id_hospedaje_acomodacion"
    // 3  id_paquetetour_set-0-Tarifa
    $(document).on("change", "select[id^='id_paquetetour_set-'][id$='-Hospedaje']", function () {
        let hospedajeacomodacion = $(this).val();
        let id = $(this).attr('id').match(/\d+/);
        let tarifahospedaje = $("#id_paquetetour_set-" + id + "-id_hospedaje_acomodacion");
        let tarifabase = $("#id_paquetetour_set-" + id + "-Tarifa");
        if (hospedajeacomodacion) {
            $.ajax({
                url: "/hospacomodacion",
                data: {
                    q: hospedajeacomodacion,
                },
                dataType: "json",
                success: function (data) {
                    tarifabase.empty();
                    const opciones = data.map(
                        (valor) =>
                            `<option value="${valor.id_hospedaje_acomodacion}">
                                ${valor.id_acomodacion__nombre}
                            </option>`
                    );
                    // Actualizamos el contenido en un solo paso para evitar múltiples manipulaciones del DOM
                    tarifahospedaje
                        .empty()
                        .append("<option>Seleccione una acomodación</option>")
                        .append(opciones);
                },
            });
        }
    });
    // tarifa
    $(document).on("change", "select[id^='id_paquetetour_set-'][id$= '-id_hospedaje_acomodacion']", function () {
        let hospeacomo = $(this).val();
        let id = $(this).attr("id").match(/\d+/); //attr:para buscar match: para buscar los id
        let tarifahospe = $("#id_paquetetour_set-" + id + "-Tarifa"
        );

        if (hospeacomo) {
            $.ajax({
                url: "/obtenerhospAcomodacion",
                data: { q: hospeacomo },
                success: function (data) {
                    tarifahospe.val(data[0].tarifa);
                },
                error: function (xhr, status, error) {
                    console.error("Error en calculo:", error);
                }
            });
        }
    });

    // calculo
    let TotalNinos = 0;
    let TotalInfantes = 0;
    let TotalAdultos = 0;
    let TarifaNumero = parseInt($('#Tarifade').text().replace("Tarifade: ", "").trim());

    $('#agregarcen').on('click', function () {
        let cantNinos = parseInt($("#numninos").val());
        let cantInfantes = parseInt($("#numinfantes").val());
        let cantHabitaciones = parseInt($("#numsencilla").val());
        let cantAdultos = parseInt($("#numadultos").val());

        if (cantNinos > 2 || cantInfantes > 2 || (cantNinos + cantInfantes + cantAdultos) > 4) {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Excediendo el límite de ocupantes en la habitación.",
            });
        } else if (cantHabitaciones < 1 || cantHabitaciones > 2) {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "El número de habitaciones debe estar entre 1 y 2.",
            });
        } else {
            let tarifaTotalPorHabitacion = TarifaNumero * cantHabitaciones;

            TotalInfantes = (TarifaNumero * 0.10) * cantInfantes;
            TotalNinos = (TarifaNumero * 0.75) * cantNinos;
            TotalAdultos = TarifaNumero * cantAdultos;

            let valorTotal = tarifaTotalPorHabitacion + TotalInfantes + TotalNinos + TotalAdultos;

            document.getElementById('ValorAPagar').innerHTML = "Valor A Pagar: $" + valorTotal.toFixed(2);
        }
    });

    // habitacion doble
    $('#agregardo').on('click', function () {
        let cantNinos = parseInt($("#numninosdoble").val());
        let cantInfantes = parseInt($("#numinfantesdoble").val());
        let cantHabitaciones = parseInt($("#numhabitacionesdoble").val());
        let cantAdultos = parseInt($("#numadultosdoble").val());

        if (cantNinos > 4 || cantInfantes > 4 || (cantNinos + cantInfantes + cantAdultos) > 6) {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Excediendo el límite de ocupantes en la habitación.",
            });
        } else if (cantHabitaciones < 1 || cantHabitaciones > 4) {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "El número de habitaciones debe estar entre 1 y 4.",
            });
        } else {
            let tarifaTotalPorHabitacion = TarifaNumero * cantHabitaciones;

            TotalInfantes = (TarifaNumero * 0.10) * cantInfantes;
            TotalNinos = (TarifaNumero * 0.75) * cantNinos;
            TotalAdultos = TarifaNumero * cantAdultos;

            let valorTotal = tarifaTotalPorHabitacion + TotalInfantes + TotalNinos + TotalAdultos;

            document.getElementById('ValorAPagar').innerHTML = "Valor A Pagar: $" + valorTotal.toFixed(2);
        }
    });

    // habitación triple
    $('#agregartriple').on('click', function () {
        let cantNinos = parseInt($("#numninostriple").val());
        let cantInfantes = parseInt($("#numinfantestriple").val());
        let cantHabitaciones = parseInt($("#numhabitacionestriple").val());
        let cantAdultos = parseInt($("#numadultostri").val());

        if (cantNinos > 6 || cantInfantes > 6 || (cantNinos + cantInfantes + cantAdultos) > 9) {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Excediendo el límite de ocupantes en la habitación.",
            });
        } else if (cantHabitaciones < 1 || cantHabitaciones > 6) {
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "El número de habitaciones debe estar entre 1 y 6.",
            });
        } else {
            let tarifaTotalPorHabitacion = TarifaNumero * cantHabitaciones;

            TotalInfantes = (TarifaNumero * 0.10) * cantInfantes;
            TotalNinos = (TarifaNumero * 0.75) * cantNinos;
            TotalAdultos = TarifaNumero * cantAdultos;

            let valorTotal = tarifaTotalPorHabitacion + TotalInfantes + TotalNinos + TotalAdultos;

            document.getElementById('ValorAPagar').innerHTML = "Valor A Pagar: $" + valorTotal.toFixed(2);
        }
    });

    $('#btnguardar').on('click', function () {
        let form = document.getElementById('formReserva');
        if (form && form.checkValidity()) {
            alert('Reserva guardada');
            let modal = document.getElementById('infoModal');

            if (modal) {
                let modalInstance = bootstrap.Modal.getInstance(modal);
                if (modalInstance) {
                    modalInstance.hide();
                }
            }
        } else {
            alert('Por favor, complete todos los campos.');
        }
    });

});
