$(document).ready(function(){
	$('.grid').masonry({
	  itemSelector: '.grid-item',
	  columnWidth: 60 
	});

	$('.add-to-card').on('click', function(){
		var card = {},
			productId = $(this).attr('data-product_id');

		if ($.cookie('ag_card')) {
			card = JSON.parse($.cookie('ag_card'));
		}
		
		card['products'] = card['products'] || {};
		card['products'][productId] = card['products'][productId] ? card['products'][productId] + 1 : 1
		card['counter'] = card['counter'] ? card['counter'] + 1 : 1
		console.log(card['products']);
		$('#shopping-counter').html(card['counter']);
		$.cookie('ag_card', JSON.stringify(card));
	});
})