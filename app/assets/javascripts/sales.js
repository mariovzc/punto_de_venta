$(document).ready(function(){
	$('.borrar_venta').bind('ajax:success', function() {  
		$(this).closest('tr').fadeOut();
	  });
	$('.borrar_detalle').bind('ajax:success', function() {  
		$(this).closest('tr').fadeOut();
	});

	//EDITAR DETALLE DE VENTA
	$('.edit-sale-details').click(function(e){
		e.preventDefault();
		var items = $(this).attr('id').split('-');
		var id = items[3];
		var temp = "/sale_details/"+id+".json";
		$.get(temp, function(data){
			$('#edit_product').val(data.product_id);
			$('#edit_cantidad').val(data.cantidad);
		});
		$('#edit_sale_detail').attr('action',temp);
	});
	$(document).on('ajax:success', '#edit_sale_detail', function(event, data){
		location.reload();
	});
	$(document).on('ajax:error', '#edit_sale_detail', function(event, data){
		alert("nooo");
	});



});