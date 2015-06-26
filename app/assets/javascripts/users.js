$(document).ready(function(){
  var requerido = "Campo Requerido";
  var solo_numeros = "Solo Numeros";
  var correo = "Digite un Correo Valido";
  $("#new_user" ).validate({
    rules: {
      'user[nombres]': { required: true},
      'user[cedula]': {number: true, required: true},          
      'user[email]': {email: true, required: true},
      'user[telefono]': {number: true}          
    },
    messages: {
      'user[nombres]': { required: requerido},
      'user[cedula]': {number: solo_numeros , required: requerido},
      'user[email]': {email: correo, required: requerido},
      'user[telefono]': {number: solo_numeros}
    }
  });

  $("#edit_user" ).validate({
    rules: {
      'user[nombres]': { required: true},
      'user[cedula]': {number: true, required: true},          
      'user[email]': {email: true, required: true},
      'user[telefono]': {number: true}          
    },
    messages: {
      'user[nombres]': { required: requerido},
      'user[cedula]': {number: solo_numeros , required: requerido},
      'user[email]': {email: correo, required: requerido},
      'user[telefono]': {number: solo_numeros}
    }
  });
  $('.borrar_usuario').bind('ajax:success', function() {  
    $(this).closest('tr').fadeOut();
  });
  $('.edit-users').click(function(e){
    e.preventDefault();
    var items = $(this).attr('id').split('-');
    var id = items[2];
    var temp = "/users/"+id+".json";
    $.get(temp, function(data){
      $('#edit_nombre').val(data.nombres);
      $('#edit_direccion').val(data.direccion);
      $('#edit_telefono').val(data.telefono);
      $('#edit_email').val(data.email);
      $('#edit_observacion').val(data.observacion);

      if (data.sexo == true) {
        $('#edit_check_true').val(['true']);        
      }else if (data.sexo == false){
        $('#edit_check_false').val(['false']);
      } else {
        $('#edit_check_true').val();        
        $('#edit_check_false').val();                 
      };
    });
    $('#edit_user').attr('action',temp);
  });
  $(document).on('ajax:success', '#edit_user', function(event, data){
    alert("siii");
    location.reload();
  });
  $(document).on('ajax:error', '#edit_user', function(event, data){
    alert("nooo");
  });  
});