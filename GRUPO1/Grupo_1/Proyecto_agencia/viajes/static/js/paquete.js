$(document).ready(function () {
  // console.log("ingreso");
  // let tarifa_agencia =$("#id_hospedajeacomodacion_set-0-tarifa_agencia");
  // let tarifa_hospedaje =$("#id_hospedajeacomodacion_set-0-tarifa");
  // tarifa_agencia.on("input",function() {
  //     let tarifa = $(this).val();
  //     tarifa_hospedaje.val(tarifa * 1.2)//calcula la tarifa con el 20%
  //     console.log(tarifa);
  //     console.log(tarifa_hospedaje.val());
  // });
  $(document).on(//para los eventos
    "input",
    "input[id^='id_hospedajeacomodacion_set-'][id$= '-tarifa_agencia']",
    function () {
      let tarifa_agencia = $(this);
      let id = tarifa_agencia.attr("id").match(/\d+/); //attr:para buscar match: para buscar los id
      let tarifa_hospedaje = $(
        "#id_hospedajeacomodacion_set-" + id + "-tarifa"
      );
      let tarifa = tarifa_agencia.val();
      tarifa_hospedaje.val((tarifa * 1.2).toFixed(1)); //permite el metodo del redondeo
      //  console.log("tarifa_agencia",tarifa_agencia.val())
      //  console.log("tarifa_hospedaje",tarifa_hospedaje.val())
      //  console.log("tarifa_hospedaje",tarifa_hospedaje)
      const habitaciones = 200000;
      let calculo = habitaciones + tarifa;
      console.log(calculo);
    }
  );
///////////////////////////////////////////////////////////////////////////////////////////////////
  $(document).on("change", "select[id^='id_paquetetour_set-'][id$= '-hospedaje']", function() {
    // Obtén el valor seleccionado del select
    let id_hospedaje = $(this).val();
    let id = $(this).attr("id").match(/\d+/); //attr:para buscar match: para buscar los id
    let acomodacion_hospedaje = $("#id_paquetetour_set-" + id + "-id_hospedaje_acomodacion")
    let tarifa = $("#id_paquetetour_set-" + id + "-tarifa");
    // Verifica que haya un valor seleccionado antes de proceder
    if (id_hospedaje) {
        // Realiza la solicitud AJAX
        $.ajax({
            url: "/acomodacion_hospedaje",  // URL de la vista Django que maneja la solicitud
            data: { q: id_hospedaje },  // Enviar el valor del hospedaje como parámetro
            dataType: "json",
            success: function (data) {
                acomodacion_hospedaje.empty(); // Limpia las opciones anteriores
                tarifa.empty();
                acomodacion_hospedaje.append("<option value=''>Seleccione una acomodación</option>"); // Añade una opción por defecto
                const opciones = data.map(
                  (valor) =>
                    `<option value="${valor.id_hospedaje_acomodacion}">
                        ${valor.id_acomodacion__nombre}
                    </option>`
                );
                // Actualizamos el contenido en un solo paso para evitar múltiples manipulaciones del DOM 
                acomodacion_hospedaje
                .empty()
                .append("<option>Seleccione una acomodación</option>")
                .append(opciones);
            },
            error: function (xhr, status, error) {
                console.error("Error en la solicitud AJAX:", error);
            }
        });
    }
});
///////////////////////////////////////////////////////////////////////////////////////////////////
$(document).on("change", "select[id^='id_paquetetour_set-'][id$= '-id_hospedaje_acomodacion']", function() {
  // Obtén el valor seleccionado del select
  let id_hospedaje_acomodacion = $(this).val();
  let id = $(this).attr("id").match(/\d+/); //attr:para buscar match: para buscar los id
  let tarifa_hospedaje = $("#id_paquetetour_set-" + id + "-tarifa"
  );
  // Verifica que haya un valor seleccionado antes de proceder
  if (id_hospedaje_acomodacion) {
      // Realiza la solicitud AJAX
      $.ajax({
          url: "/tarifa_hospedaje_acomodacion",  // URL de la vista Django que maneja la solicitud
          data: { q: id_hospedaje_acomodacion },  // Enviar el valor del hospedaje como parámetro
          success: function (data) {
              // Asignar valor al input de tarifa 
              tarifa_hospedaje.val(data[0].tarifa);  // Asignar el valor al inpu
          },
          error: function (xhr, status, error) {
              console.error("Error en la solicitud AJAX:", error);
          }
   });
}
});
///////////////////////////////////////////////////////////////////////////////////////////////////
  //hacer un codigo donde calcule el valor de las personas agregadas

  function calcularS() {
    $("#valorHabitacion").change(function () {
      let valorSelecionado = $(this).val();
      let valor_tarifa = parseFloat($("#valor_tarifa").text());
      let total_precioS = $("#total_precio");
      $("#total_habitaciones").html(valorSelecionado);
      let accion = parseInt(valorSelecionado * 1);
      $("#NumAdultos").html(accion);
      let calculo = parseFloat(valor_tarifa * accion);
      total_precioS.html(calculo);
      $("#valorNiñoS").change(function () {
        actualizarTotalmenores(); // Llama a la función que calcula los ninos y actualizar el total
      }); 
      $("#valorInfanteS").change(function () {
        actualizarTotalmenores(); // Llama a la función que calcula los infantes y actualizar el total
      });
      function actualizarTotalmenores() {
        let valorNs = parseInt($("#valorNiñoS").val()) || 0; // Niños
        let valorIs = parseInt($("#valorInfanteS").val()) || 0; // Infantes
        let accion = parseInt(valorSelecionado) || 0; // Adultos
        // Cálculo de tarifas
        let calculoAdultos = parseFloat(valor_tarifa * accion); // Precio total de adultos
        let calculoNs = parseFloat(valor_tarifa * 0.75 * valorNs); // 75% por niños
        let calculoIs = parseFloat(valor_tarifa * 0.10 * valorIs); // 10% por infantes
        // Sumar todos los totales
        let totalConTodo = calculoAdultos + calculoNs + calculoIs;
        // Actualizar la interfaz
        total_precioS.html(totalConTodo);
        $("#NumAdultos").html(accion);
        $(".tarifaNs").html(calculoNs);
        $(".tarifaIs").html(calculoIs);
      }   
    });

    $("#valorHabitacionD").change(function () {
        let valorSelecionadoD = $(this).val();
        let valor_tarifaD = parseFloat($("#valor_tarifaD").text());
        let total_precioD = $("#total_precioD");
        $("#total_habitacionesD").html(valorSelecionadoD);
        let accionD = parseInt(valorSelecionadoD * 2);
        $("#NumAdultosD").html(accionD);
        let calculoD = parseFloat(valor_tarifaD * accionD);
        total_precioD.html(calculoD);
        // Evento para el cambio en la selección de niños
          $("#valorNiñosD").change(function () {
            actualizarTotalmenores(); 
          });
          // Evento para el cambio en la selección de infantes
          $("#valorInfanteD").change(function () {
            actualizarTotalmenores(); 
          });

          function actualizarTotalmenores() {
            let valorNd = parseInt($("#valorNiñosD").val()) || 0; // Obtiene el número de niños, o 0 si está vacío
            let valorId = parseInt($("#valorInfanteD").val()) || 0; // Obtiene el número de infantes, o 0 si está vacío
            let valorSelecionadoD = parseInt($("#valorHabitacionD").val()) || 0; // Obtiene el valor seleccionado de adultos
            let accionD = parseInt(valorSelecionadoD * 2 - valorNd) || 0; // Calcula el número de adultos, restando los niños

            // Cálculo de tarifas para adultos, niños e infantes
            let calculoAdultosD = parseFloat(valor_tarifaD * accionD); // Precio total de adultos
            let calculoNd = parseFloat(valor_tarifaD * 0.75 * valorNd); // 75% de descuento para los niños
            let calculoId = parseFloat(valor_tarifaD * 0.10 * valorId); // 10% de descuento para los infantes

            // Suma total de todos los valores
            let totalConTodo = calculoAdultosD + calculoNd + calculoId;

            // Actualiza los elementos en la interfaz
            total_precioD.html(totalConTodo); // Muestra el precio total
            $("#NumAdultosD").html(accionD); // Muestra el número de adultos después de restar los niños
            $(".tarifaNd").html(calculoNd); // Muestra el cálculo de la tarifa para niños
            $(".tarifaId").html(calculoId); // Muestra el cálculo de la tarifa para infantes
          }
    });

    $("#valorHabitacionT").change(function () {
      let valorSelecionadoT = $(this).val();
      let valor_tarifaT = parseFloat($("#valor_tarifaT").text());
      let total_precioT = $("#total_precioT");
      $("#total_habitacionesT").html(valorSelecionadoT);
      let accionT = parseInt(valorSelecionadoT * 3);
      let calculoT = parseFloat(valor_tarifaT * accionT);
      total_precioT.html(calculoT);
      $("#NumAdultosT").html(accionT);
      // Evento para el cambio en la selección de niños
      $("#valorNiñosT").change(function () {
        actualizarTotalmenores(); 
      });
      // Evento para el cambio en la selección de infantes
      $("#valorInfanteT").change(function () {
        actualizarTotalmenores(); 
      });
    
     function actualizarTotalmenores() {
      let valorNt = parseInt($("#valorNiñosT").val()) || 0; // Obtiene el número de niños, o 0 si está vacío
      let valorIt = parseInt($("#valorInfanteT").val()) || 0; // Obtiene el número de infantes, o 0 si está vacío
      let valorSelecionadoT = parseInt($("#valorHabitacionT").val()) || 0; // Obtiene el valor seleccionado de adultos
      let accionT = parseInt(valorSelecionadoT * 3 - valorNt) || 0; // Calcula el número de adultos, restando los niños

      // Cálculo de tarifas para adultos, niños e infantes
      let calculoAdultosT = parseFloat(valor_tarifaT * accionT); // Precio total de adultos
      let calculoNt = parseFloat(valor_tarifaT * 0.75 * valorNt); // 75% de descuento para los niños
      let calculoIt = parseFloat(valor_tarifaT * 0.10 * valorIt); // 10% de descuento para los infantes
    
      // Suma total de todos los valores
      let totalConTodo = calculoAdultosT + calculoNt + calculoIt;
    
      // Actualiza los elementos en la interfaz
      total_precioT.html(totalConTodo); // Muestra el precio total
      $("#NumAdultosT").html(accionT); // Muestra el número de adultos después de restar los niños
      $(".TarifaNt").html(calculoNt); // Muestra el cálculo de la tarifa para niños
      $(".tarifaIt").html(calculoIt); // Muestra el cálculo de la tarifa para infantes
    }
  });
    return;
  }
  calcularS();
  function agregarBtn() {
    $("button").click(function () {
      let btn = $(this).data("agregar");
      let total_precioS = parseFloat($("#total_precio").text());
      let total_precioD = parseFloat($("#total_precioD").text());
      let total_precioT = parseFloat($("#total_precioT").text());
      let totaHabitacionS=$("#total_habitaciones").text();
      let totaHabitacionD=$("#total_habitacionesD").text();
      let totaHabitacionT=$("#total_habitacionesT").text();
      let totalAdultosS=$("#NumAdultos").text();
      let totalAdultosD=$("#NumAdultosD").text();
      let totalAdultosT=$("#NumAdultosT").text();                                                              
      let totalNinosT=$("#valorNiñosT").val();
      let totalNinosD=$("#valorNiñosD").val(); 
      let totalNinoS=$("#valorNiñoS").val();
      let totalInfanteS=$("#valorInfanteS").val();
      let totalInfanteD=$("#valorInfanteD").val();
      let totalInfanteT=$("#valorInfanteT").val();                                                              
      let destino = $(".contenedorR");
      let fecha = $('#fecha').text(this).val();

      if (btn === "agregarS" && total_precioS > 1) {
       
        console.log("agrego");
        Swal.fire({
          position: "top-end",
          icon: "success",
          title: "Habitacion Simple agregada",
          showConfirmButton: false,
          timer: 1500,
        });
        destino.append(`<div class ="contenedorS" >  
           <div  class ="container_logoEliminar"> <button data-eliminar="EliminarS" id ="ocultarS"><img src="static/assets/img/borrar.png" alt="" class="log_eliminar"></button></div>           
            
           <div class ="detalles_simple">
               <div class="text_habitacionS"><p>Acomodacion :</p><p class="text_habitacionS_ocult"> Simple</p></div>
               <div class="text_habitacionS"><p>Habitaciones :</p><p class="text_habitacionS_ocult"> ${totaHabitacionS}</p></div>
               <div class="text_habitacionS"><p>Adultos :</p><p class="text_habitacionS_ocult"> ${totalAdultosS} </p></div>
               <div class="text_habitacionS"><p>Niños :</p><p class="text_habitacionS_ocult">${totalNinoS} </p></div>
               <div class="text_habitacionS"><p>Infantes :</p><p class="text_habitacionS_ocult">${totalInfanteS} </p></div>
               <div class="text_habitacionS"><p> Valor :</p><p class="text_habitacionS_ocult">${total_precioS}</p></div>
               <div class="text_habitacionS"><p> Fecha :</p><p class="text_habitacionS_ocult"> ${fecha}</div>      
             </div> 
             </div> `);    

         // Deshabilitar el botón de agregar para evitar múltiples clics
         $(this).prop("disabled", true);             
         $("#AgregarS").css("background-color", "#F56F01");

         // Habilitar el botón de cotizar
         let btnC = $("#cotizar").prop("disabled", false); 
         btnC.css("background-color", "#F56F01");

        // Deshabilitar los selectores al agregar la habitación
        $("#valorHabitacion, #NumAdultos, #valorNiñoS, #valorInfanteS, #valorAdultos").prop("disabled", true);

        // Función para eliminar la opcion agregada
         eliminarBtn();

      } else if (btn === "agregarD" && total_precioD > 1) {
        console.log("agregod");
        Swal.fire({
          position: "top-end",
          icon: "success",
          title: "Habitacion doble agregada",
          showConfirmButton: false,
          timer: 1500,
        });
        destino.append(` <div class ="contenedorD" >  
           <div  class ="container_logoEliminar"><button data-eliminar="EliminarD" id ="ocultarD"><img src="static/assets/img/borrar.png" alt="" class="log_eliminar"></button></div>           
                <div class ="detalles_doble "> 
                <div class="text_habitacionS"><p> Acomodacion: </p><p class="text_habitacionS_ocult"> Doble</p></div>
                <div class="text_habitacionS"><p> Habitaciones: </p><p class="text_habitacionS_ocult"> ${totaHabitacionD}</p></div>
                <div class="text_habitacionS"><p> Adultos: </p><p class="text_habitacionS_ocult"> ${totalAdultosD}</p></div>
                <div class="text_habitacionS"><p> Niños: </p><p class="text_habitacionS_ocult"> ${totalNinosD}</p></div>
                <div class="text_habitacionS"><p>Infantes :</p><p class="text_habitacionS_ocult"> ${totalInfanteD} </p></div>
                <div class="text_habitacionS"><p> Valor: </p><p class="text_habitacionS_ocult"> ${total_precioD}</p></div>
                <div class="text_habitacionS"><p> Fecha: </p><p class="text_habitacionS_ocult"> ${fecha}</p></div>
              </div> 
              </div> `);
        // Deshabilitar el botón de agregar para evitar múltiples clics
        $(this).prop("disabled", true); 

        // Habilitar el botón de cotizar
        let btnC = $("#cotizar").prop("disabled", false);
        btnC.css("background-color", "#F56F01");

        // Deshabilitar los selectores al agregar la habitación
        $("#valorHabitacionD, #NumAdultosD, #valorNiñosD, #valorInfanteD, #valorAdultosD").prop("disabled", true);

        // Función para eliminar la opcion agregada
        eliminarBtn();
      } else if (btn === "agregarT" && total_precioT > 1) {      
        Swal.fire({
          position: "top-end",
          icon: "success",
          title: "Habitacion Triple agregada",
          showConfirmButton: false,
          timer: 1500,
        });
        console.log(destino);
        destino.append(` <div class ="contenedorT" >  
           <div  class ="container_logoEliminar"><button data-eliminar="EliminarT" id ="ocultarT"><img src="static/assets/img/borrar.png" alt="" class="log_eliminar"></button></div>  
           <div class ="detalles_triple " >        
                <div class="text_habitacionS"><p> Acomodacion: </p><p class="text_habitacionS_ocult">Triple</p></div>
                <div class="text_habitacionS"><p> Habitaciones: </p><p class="text_habitacionS_ocult">${totaHabitacionT} </p></div>
                <div class="text_habitacionS"><p> Adultos: </p><p class="text_habitacionS_ocult">${totalAdultosT} </p></div>
                <div class="text_habitacionS"><p> Niños: </p><p class="text_habitacionS_ocult">${totalNinosT} </p></div>
                <div class="text_habitacionS"><p>Infantes :</p><p class="text_habitacionS_ocult"> ${totalInfanteT} </p></div>
                <div class="text_habitacionS"><p> Valor: </p><p class="text_habitacionS_ocult">${total_precioT }</p></div>
                <div class="text_habitacionS"><p> Fecha: </p><p class="text_habitacionS_ocult">${fecha}</p></div> 
               </div>
               </div>`);

         // Deshabilitar el botón de agregar para evitar múltiples clics
         $(this).prop("disabled", true); 

         // Habilitar el botón de cotizar
         let btnC = $("#cotizar").prop("disabled", false);
         btnC.css("background-color", "#F56F01");
        
         // Deshabilitar los selectores al agregar la habitación
         $("#valorHabitacionT, #NumAdultosT, #valorNiñosT, #valorInfanteT, #valorAdultosT").prop("disabled", true);

         // Función para eliminar la opcion agregada
         eliminarBtn()
      } else if (btn === "cotizar") {
        $("#cotizar").on("click", function () {
          // Obtiene el valor del botón
          let btnC = $(this).val();

          // Envía el usuario a la nueva URL, pasando el valor del botón como parámetro
          window.location.href = `detalles_reservas?q=${btnC}`;

          let cotiza = $(".contenedorR"); // Este es el div de donde tomas la información
          let contenidoAAgregar = cotiza.html(); // Obtén el contenido de ese div
          localStorage.setItem("contenidoReserva", contenidoAAgregar); 
        });
      }
    });
  }
  $(document).ready(function () {
    // Recupera el contenido del localStorage
    let contenidoReserva = localStorage.getItem("contenidoReserva");

    // Verifica si hay contenido y lo agrega al div deseado
    if (contenidoReserva) {
        let destino = $(".registrosR");
        destino.empty(); // Limpia el contenido anterior
        destino.append(contenidoReserva); // Agrega el nuevo contenido
        let ocultar = $("#ocultarS, #ocultarD, #ocultarT").css("display","none");
    }
});
  function eliminarBtn() {
    $("button").click(function () {
      let elimina = $(this).data("eliminar");
      if (elimina === "EliminarS"){
          // Mostrar una alerta de confirmación con SweetAlert
          Swal.fire({
            title: '¿Estás seguro?',
            text: "Esta acción no se puede deshacer.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
          }).then((result) => {
            if (result.isConfirmed) {
              // Eliminar el div padre del botón de eliminar
              $(this).closest('.contenedorS').remove();
              // Mostrar un mensaje de éxito
              Swal.fire(
                'Eliminado!',
                'El elemento ha sido eliminado.',
                'success'
              ); 
              // Volver a habilitar los selectores
              $("#valorHabitacion, #NumAdultos, #valorNiñoS, #valorInfanteS, #valorAdultos").prop("disabled", false);
              // Restablecer los valores de los selectores a su valor inicial
              $("#valorHabitacion").prop('selectedIndex', 0); // Resetea al primer valor del select
              $("#NumAdultos").prop('selectedIndex', 0); 
              $("#valorNiñoS").prop('selectedIndex', 0); 
              $("#valorInfanteS").prop('selectedIndex', 0);
              $("#valorAdultos").prop('selectedIndex', 0);
              // Habilitar el botón "AgregarS" después de eliminar un elemento
              $("#AgregarS").prop("disabled", false);
              $("#AgregarS").css("background-color", "#F56F01"); // Cambiar el color al habilitar
              let btnC = $("#cotizar").prop("disabled", true); // desabilita boton cotizar
              btnC.css("background-color", "#D3D3D3");
            }
          });
      }else if (elimina === "EliminarD"){
        Swal.fire({
          title: '¿Estás seguro?',
          text: "Esta acción no se puede deshacer.",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Sí, eliminar',
          cancelButtonText: 'Cancelar'
        }).then((result) => {
          if (result.isConfirmed) {
            // Eliminar el div padre del botón de eliminar
            $(this).closest('.contenedorD').remove();
            // Mostrar un mensaje de éxito
            Swal.fire(
              'Eliminado!',
              'El elemento ha sido eliminado.',
              'success'
            ); 
              // Volver a habilitar los selectores
              $("#valorHabitacionD, #NumAdultosD, #valorNiñosD, #valorInfanteD, #valorAdultosD").prop("disabled", false);
              // Restablecer los valores de los selectores a su valor inicial
              $("#valorHabitacionD").prop('selectedIndex', 0); // Resetea al primer valor del select
              $("#NumAdultosD").prop('selectedIndex', 0); 
              $("#valorNiñosD").prop('selectedIndex', 0); 
              $("#valorInfanteD").prop('selectedIndex', 0);
              $("#valorAdultosD").prop('selectedIndex', 0);
              // Habilitar el botón "AgregarD" después de eliminar un elemento
              $("#AgregarD").prop("disabled", false);
              $("#AgregarD").css("background-color", "#F56F01"); // Cambiar el color al habilitar
              let btnC = $("#cotizar").prop("disabled", true); // desabilita boton cotizar
              btnC.css("background-color", "#D3D3D3");
          }
        });
      } else if(elimina === "EliminarT"){
        Swal.fire({
          title: '¿Estás seguro?',
          text: "Esta acción no se puede deshacer.",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Sí, eliminar',
          cancelButtonText: 'Cancelar'
        }).then((result) => {
          if (result.isConfirmed) {
            // Eliminar el div padre del botón de eliminar
            $(this).closest('.contenedorT').remove();
            // Mostrar un mensaje de éxito
            Swal.fire(
              'Eliminado!',
              'El elemento ha sido eliminado.',
              'success'
            ); 
              // Volver a habilitar los selectores
              $("#valorHabitacionT, #NumAdultosT, #valorNiñosT, #valorInfanteT, #valorAdultosT").prop("disabled", false);
              // Restablecer los valores de los selectores a su valor inicial
              $("#valorHabitacionT").prop('selectedIndex', 0); // Resetea al primer valor del select
              $("#NumAdultosT").prop('selectedIndex', 0); 
              $("#valorNiñosT").prop('selectedIndex', 0); 
              $("#valorInfanteT").prop('selectedIndex', 0);
              $("#valorAdultosT").prop('selectedIndex', 0);
              // Habilitar el botón "AgregarT" después de eliminar un elemento
              $("#AgregarT").prop("disabled", false);
              $("#AgregarT").css("background-color", "#F56F01"); // Cambiar el color al habilitar
              let btnC = $("#cotizar").prop("disabled", true); // desabilita boton cotizar
              btnC.css("background-color", "#D3D3D3");
          }
        });
      }
    });
  }
  agregarBtn();

});
