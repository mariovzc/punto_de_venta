$(document).ready(function(){
  var requerido = "Campo Requerido";
  var solo_numeros = "Solo Numeros";
  var correo = "Digite un Correo Valido";
  $("#new_client" ).validate({
    rules: {
      'client[nombres]': { required: true},
      'client[cedula]': {number: true, required: true},          
      'client[correo]': {email: true},
      'client[telefono]': {number: true}          
    },
    messages: {
      'client[nombres]': { required: requerido},
      'client[cedula]': {number: solo_numeros , required: requerido},
      'client[correo]': {email: correo},
      'client[telefono]': {number: solo_numeros}
    }
  });

  $(".edit_client" ).validate({
    rules: {
      'client[nombres]': { required: true},
      'client[cedula]': {number: true, required: true},          
      'client[correo]': {email: true},
      'client[telefono]': {number: true}          
    },
    messages: {
      'client[nombres]': { required: requerido},
      'client[cedula]': {number: solo_numeros , required: requerido},
      'client[correo]': {email: correo},
      'client[telefono]': {number: solo_numeros}
    }
  });

});