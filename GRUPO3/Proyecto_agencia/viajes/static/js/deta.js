$(document).ready(function () {
    // // calculo

    // let TotalNinos = 0;
    // let TotalInfantes = 0;
    // let TarifaNumero = parseInt(document.getElementById('Tarifa').innerHTML);

    // $('#agregardo').on('click', function () {
    //     let cantNinos = parseInt($("#numninos").val());
    //     let cantInfantes = parseInt($("#numinfantes").val());
    //     let cantHabitaciones = parseInt($("#numsencilla").val());

    //     if (cantNinos > 2 || cantInfantes > 2 || (cantNinos + cantInfantes) > 2) {
    //         Swal.fire({
    //             icon: "error",
    //             title: "Oops...",
    //             text: "Excediendo el límite de ocupantes en la habitación.",
    //         });
    //     } else if (cantHabitaciones < 1 || cantHabitaciones > 2) {
    //         Swal.fire({
    //             icon: "error",
    //             title: "Oops...",
    //             text: "El número de habitaciones debe estar entre 1 y 2.",
    //         });
    //     } else {
    //         TotalInfantes = (TarifaNumero * 0.10) * cantInfantes;
    //         TotalNinos = (TarifaNumero * 0.75) * cantNinos;
    //         console.log("Sencilla - Habitaciones: " + cantHabitaciones + ", Niños: " + cantNinos + ", Infantes: " + cantInfantes);
    //     }
    // });

    // //  habitación doble
    // $('#agregardo').on('click', function () {
    //     let cantNinos = parseInt($("#numninosdoble").val());
    //     let cantInfantes = parseInt($("#numinfantesdoble").val());
    //     let cantHabitaciones = parseInt($("#numhabitacionesdoble").val());

    //     if (cantNinos > 4 || cantInfantes > 4 || (cantNinos + cantInfantes) > 4) {
    //         Swal.fire({
    //             icon: "error",
    //             title: "Oops...",
    //             text: "Excediendo el límite de ocupantes en la habitación.",
    //         });
    //     } else if (cantHabitaciones < 3 || cantHabitaciones > 4) {
    //         Swal.fire({
    //             icon: "error",
    //             title: "Oops...",
    //             text: "El número de habitaciones debe estar entre 3 y 4.",
    //         });
    //     } else {
    //         TotalInfantes = (TarifaNumero * 0.10) * cantInfantes;
    //         TotalNinos = (TarifaNumero * 0.10) * cantNinos;
    //         console.log("Doble - Habitaciones: " + cantHabitaciones + ", Niños: " + cantNinos + ", Infantes: " + cantInfantes);
    //     }
    // });

    // // habitación triple
    // $('#agregartriple').on('click', function () {
    //     let cantNinos = parseInt($("#numninostriple").val());
    //     let cantInfantes = parseInt($("#numinfantestriple").val());
    //     let cantHabitaciones = parseInt($("#numhabitacionestriple").val());

    //     if (cantNinos > 6 || cantInfantes > 6 || (cantNinos + cantInfantes) > 6) {
    //         Swal.fire({
    //             icon: "error",
    //             title: "Oops...",
    //             text: "Excediendo el límite de ocupantes en la habitación.",
    //         });
    //     } else if (cantHabitaciones < 5 || cantHabitaciones > 6) {
    //         Swal.fire({
    //             icon: "error",
    //             title: "Oops...",
    //             text: "El número de habitaciones debe estar entre 5 y 6.",
    //         });
    //     } else {
    //         TotalInfantes = (TarifaNumero * 0.10) * cantInfantes;
    //         TotalNinos = (TarifaNumero * 0.10) * cantNinos;
    //         console.log("Triple - Habitaciones: " + cantHabitaciones + ", Niños: " + cantNinos + ", Infantes: " + cantInfantes);
    //     }
    // });
});