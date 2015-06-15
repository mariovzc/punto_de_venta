$('.borrar_venta').bind('ajax:success', function() {  
        $(this).closest('tr').fadeOut();
  });  