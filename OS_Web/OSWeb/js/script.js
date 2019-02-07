

function SetRequired() {
    $(".modal-body :input").prop("required", true)
}

function RemoveRequired() {
    $(".modal-body :input").prop("required", false)
}    


function ActivarBotonBaja() {
    $("#btnBaja").prop("disabled", false)

}

function DesactivarBotonBaja() {
    $("#btnBaja").prop("disabled", true);

};

function editarEmpleador() {
    $(":input").prop("disabled", false);
    $("#btnGuardar").removeAttr("style");

};

function LabelAgregar() {
    $('#hdnEdit').val("0");
    $('#myModalLabel').html('Nuevo Empleado');
    DesactivarBotonBaja();
    clearText();
    SetRequired();
};

function EjecutaFuncion() {
    var table = $('#gvEmpleados').DataTable({
        responsive: true,
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });

    new $.fn.dataTable.FixedHeader(table);
}


Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EjecutaFuncion);

$(document).ready(function () {
    EjecutaFuncion();
  
});

function datepickerformat() {
    if (!Modernizr.inputtypes.date) {
        // If not native HTML5 support, fallback to jQuery datePicker
        $('input[type=date]').datepicker({
            // Consistent format with the HTML5 picker
            dateFormat: 'dd/mm/yyyy'
        },
            // Localization
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '<Ant',
                nextText: 'Sig>',
                currentText: 'Hoy',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''
            },
        $.datepicker.setDefaults($.datepicker.regional['es'])
        );
    }

}

function pageLoad(sender, args) {
    $(document).ready(function () {
        datepickerformat();
        $('#btnCalcular').click(function () {
            if ($('#txtRemBas').val() == "") {
                alert("Debe cargar una remuneracion base!")
                return false;
            }
        });

        $('.modal').on('hidden.bs.modal', function () {            
            RemoveRequired();
        })

        $("#btnCalcular").on("tap", function () {
            if ($('#txtRemBas').val() == "") {
                alert("Debe cargar una remuneracion base!")
                return false;
            }
        });

    });
}

function ActivarFechaBaja() {
    $("#txtFechaBaja").prop("disabled", false)
    $("#txtFechaBaja").prop("required", true)


}

function clearText() {
    $("#txtNombre").val("");
    $("#txtApellido").val("");
    $("#txtCuil").val("");
    $("#txtFechaAlta").val("");
    $("#txtFechaBaja").val("");

    $('#ddlAgrupacion :nth-child(1)').prop('selected', true);
    $('#ddlCategoria :nth-child(1)').prop('selected', true);
    $('#ddlTipoContrato :nth-child(1)').prop('selected', true);
    $('#ddlJornada :nth-child(1)').prop('selected', true);

}

function closeModal() {
    $('#myModal').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
}






