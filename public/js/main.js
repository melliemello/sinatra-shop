$(window).load(function(){
	$('.grid').masonry({
		itemSelector: '.grid-item',
		columnWidth: 60 
	});
});

$(document).ready(function(){
	var shoppingCard = ShoppingCard();
	shoppingCard.attachTo($('#shopping-counter'));

	$('.add-to-card').on('click', function() {
		var productId = $(this).attr('data-product_id');
		shoppingCard.add(productId);
	});
});


function ShoppingCard() {
	var $counterElement,
		card = {'products': {}, 'counter': 0 };

	function _update() {
		card['counter'] == 0 ? $counterElement.parent().hide() : $counterElement.parent().show();
		$counterElement.html(card['counter']);
	}

	function attachTo(counterElement) {
		$counterElement = counterElement;
		if ($.cookie('ag_card')) {
			card = JSON.parse($.cookie('ag_card'));
		}

		_update();
	}

	function add(productId) {
		card['products'][productId] = card['products'][productId] ? card['products'][productId] + 1 : 1;
		card['counter']++;
		$.cookie('ag_card', JSON.stringify(card));
		_update();
	}

	return {
		attachTo: attachTo,
		add: add
	}
}