$(document).ready(function () {
  $(".barrabuscar").on("input", function (event) {
    buscarDestino();
  });
 
  // Establecer la fecha mínima en el input para que no se puedan seleccionar días anteriores
  let today = new Date();
  today.setHours(0, 0, 0, 0);  // Fijar la hora a las 00:00 para que siempre sea el día actual
  let todayStr = today.toISOString().split('T')[0]; // Convertir a formato YYYY-MM-DD
  $('#fecha').attr('min', todayStr);  // Establecer la fecha mínima permitida

$('#fecha').on('change', function() {
  // Comparar la fecha seleccionada con la fecha actual
  if ($(this).val() < todayStr) {
    $(this).val('');  // Limpiar el campo si la fecha es inválida
  } else {
    // Activar el botón si la fecha es válida (hoy o futura)
    $('#boton').removeClass('inactivo').addClass('activo').data('valid', true);
  }
});

  $(".btn_selecionar").on("click", function (e) {
  e.preventDefault();
  if ($(this).data('valid')) {
  let destino = $(".ocult");
  destino.toggle();
  }
  });

  $("#Buscar").on("click", function (event) {
    let Busca = $(".barrabuscar")[0];
    let busqueda = $(".barrabuscar").val();
    

    if (!Busca.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();

      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "Por favor, escriba su consulta!",
      });
      return;
    } else {
      window.location.href = `buscar_paquete?q=${busqueda}`;
    }
  });

  function buscarDestino() {
    let destino = $(".barrabuscar").val().trim();//trim quita los espacios innecesarios
    if (destino.length > 0) { // length para saber el tamano de lo que se escribe, la condicion es para que cada que se escriba se borre de div
      $.ajax({//disparador
        url: "destino", //donde debe buscar
        data: { q: destino }, //de donde va a sacar la informacion, q lo que digitamos, data es la informacion de la consulta
        success: function (data) { //success es una promesa, funcion que muestra en caso de encontrar algo
          let mostrar = $("#resultado");//muestra la informacion que tiene el div
          mostrar.empty(); //para ELIMINAR lo que tiene el elemento div
          if (destino.length > 2) {
            if (data.length) {// para saber si hay registro con informacion
              data.forEach((element) => { //para recorrer la informacion del registro arreglo, necesita dos el index(posicion) y el element, en este caso no
                mostrar.append(`
                  <ul class="list-group">
                    <li class="list-group lista_destino">${element.destino}</li>
                  </ul>
                  `); //append agrega elementos al div, listas ordenadas con numeros y no con puntos, destino es el campo de la base de datos
              });
              $(".lista_destino").on("click", function () {
                let seleccion_destino = $(this).text();
                $(".barrabuscar").val(seleccion_destino);
                mostrar.empty();
              });
            } else {
              mostrar.append("<div> el destino no exite </div>");
            }
          } else {
            mostrar.append(
              "<div> por favor ingrese más de 2 caracteres </div>"
            );
          }
        },
      });
    } else {
      $(".resultado").empty();
    }
  }

});
