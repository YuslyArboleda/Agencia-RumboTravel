$(document).ready(function () {
    $('.nombredelinput').on('input', function () {
        buscarDestino();
    });

    $(".lis_destino").on("click", function (e) {
        e.preventDefault();
        if ($(this).data('valid')) {
            let destino = $(".ocult");
            destino.toggle();
        }
    });

    $('#botonbusc').on('click', function (e) {
        let Busqueda = $('.nombredelinput')[0];
        let bus = $('.nombredelinput').val();
        if (!Busqueda.checkValidity()) {
            e.preventDefault()
            e.stopPropagation()
            Swal.fire({
                icon: "error",
                title: "Oops",
                text: "por favor agrega un paquete",
            });
            return; //detener
        } else {
            window.location.href = `consultar_paquete?q=${bus}`;
        }
    });
    function buscarDestino() {
        let destino = $(".nombredelinput").val().trim(); // los muestra lo que escribimos en el imput
        if (destino.length > 0) {  //  si el destino esiste o no, cada ves que escriba elimine lo que hay en el div
            $.ajax({ // disparador parecido al triguer y imediatamente se cumple la funcion 
                url: "buscar_destino",  // donde voy abuscar
                data: { q: destino }, // donde voy a buscar y q los indica el destino y data viene con la informacion de la consuta
                success: function (data) { // es la funcion promesa que si la funcion se cumple los mueste, en este caso es el destino
                    let result = $("#resultado");
                    result.empty(); // limpie lo que ya esta
                    if (destino.length > 2) { // tamaño de caracteres
                        if (data.length) { // trae la informacion de la base de datos, para saber si esiste el datos del
                            data.forEach((element) => { //ciclo 
                                result.append(` 
                                    <ul class= "list-group list_destino">
                                    <li class="list-group-item lis_destino ">${element.destino}</li>
                                    </ul>
                                `); // appemd agregamos, una lista no ordenada, agregar elementos al div y el element.destino los va a mostra lo que tengamos en el div los muestra eldestino
                            });
                            $('.lis_destino').click(function () { // funcion clik para destino
                                let selecciondestino = $(this).text(); // toma la caja de texto
                                console.log(selecciondestino); // muestra el destino seleccionado en la consola
                                $(".nombredelinput").val(selecciondestino); // cuando le de clic en el input de la lista de os destinos los muestre en el div
                                result.empty(); // lipia los resultados
                            });
                        } else {
                            result.append("<div>No contamos con ese destino</div>");
                        }
                    } else {
                        result.append("<div>Digite minimo dos caracteres</div>");
                    }
                },
            });
        } else {
            $("#resultado").empty(); //limpia los resultados anteriores
        }
    }
});

