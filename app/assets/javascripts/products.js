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

});