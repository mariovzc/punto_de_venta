$(document).ready(function(){
  var requerido = "Campo Requerido";
  var solo_numeros = "Solo Numeros";

  $("#new_product" ).validate({
    rules: {
      'product[nombre]': { required: true},
      'product[precio]': {number: true, required: true}          
    },
    messages: {
      'product[nombre]': { required: requerido},
      'product[precio]': {number: solo_numeros , required: requerido}
    }
  });

  $(".edit_product" ).validate({
    rules: {
      'product[nombre]': { required: true},
      'product[precio]': {number: true, required: true}          
    },
    messages: {
      'product[nombre]': { required: requerido},
      'product[precio]': {number: solo_numeros , required: requerido}
    }
  });
  $('.borrar_producto').bind('ajax:success', function() {  
        $(this).closest('tr').fadeOut();
  });  
/**
 $('#productos').dataTable({
    "iDisplayLength": 5,
    "aLengthMenu": [[5, 10, 20, -1], [5, 10, 20, "Todo"]],
    "bPaginate": true,
    "bLengthChange": true,
    "bFilter": true,
    "bSort": true,
    "bInfo": true
  }); 
**/
});