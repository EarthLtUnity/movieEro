$('.entry-theater-content').each(function(){
		//jQuery time
		var current_fs, next_fs, previous_fs; //fieldsets
		var left, opacity, scale; //fieldset properties which we will animate
		var animating; //flag to prevent quick multi-click glitches

		$(".theaternext").on('click',function(){
			if(animating) return false;
			animating = true;
			
			current_fs = $(this).parent();
			next_fs = $(this).parent().next();
			
			//show the next fieldset
			next_fs.show(); 
			//hide the current fieldset with style
			current_fs.animate({opacity: 0}, {
				step: function(now, mx) {
					//as the opacity of current_fs reduces to 0 - stored in "now"
					//1. scale current_fs down to 80%
					scale = 1 - (1 - now) * 0.2;
					//2. bring next_fs from the right(50%)
					left  = (now * 50)+"%";
					//3. increase opacity of next_fs to 1 as it moves in
					opacity = 1 - now;
					current_fs.css({'transform': 'scale('+scale+')'});
					next_fs.css({'left': left, 'opacity': opacity});
				}, 
				duration: 800, 
				complete: function(){
					current_fs.hide();
					animating = false;
				}, 
				//this comes from the custom easing plugin
				easing: 'easeInOutBack'
			});
		});

		$(".theaternextprevious").on('click',function(){
			if(animating) return false;
			animating = true;
			
			current_fs = $(this).parent();
			previous_fs = $(this).parent().prev();
			
			//show the previous fieldset
			previous_fs.show(); 
			//hide the current fieldset with style
			current_fs.animate({opacity: 0}, {
				step: function(now, mx) {
					//as the opacity of current_fs reduces to 0 - stored in "now"
					//1. scale previous_fs from 80% to 100%
					scale = 0.8 + (1 - now) * 0.2;
					//2. take current_fs to the right(50%) - from 0%
					left = ((1-now) * 50)+"%";
					//3. increase opacity of previous_fs to 1 as it moves in
					opacity = 1 - now;
					current_fs.css({'left': left});
					previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
				}, 
				duration: 800, 
				complete: function(){
					current_fs.hide();
					animating = false;
				}, 
				//this comes from the custom easing plugin
				easing: 'easeInOutBack'
			});
		});

		$(".submit").on('click',function(){
			return false;
		});

	});

	$(document).keydown(function(e){
 		if(e.keyCode == 27) {
 			if ($('#toggle').hasClass('active')) {
	            $('#toggle').removeClass('active');
	        } 
	        if ($('.overlay').hasClass('open')) {
	            $('.overlay').removeClass('open');
	        } 
	        if ($('#overlay-search').hasClass('active')) {
	            $('#overlay-search').removeClass('active');
	        } 
	    }
	});

	/*	var price = 13; //price
		$(document).ready(function() {
			var $cart = $('#selected-seats'), //Sitting Area
			$counter = $('#counter'), //Votes
			$total = $('#total'); //Total money
			
			var sc = $('#seat-map').seatCharts({
				map: [  //Seating chart
					'aaaaaaa_aaaaaaa_aaaaaaa',
					'aaaaaaa_aaaaaaa_aaaaaaa',
					'aaaaaaa_aaaaaaa_aaaaaaa',
					'aaaaaaa_aaaaaaa_aaaaaaa',
					'aaaaaaa_aaaaaaa_aaaaaaa'
				],
				naming : {
					top : false,
					getLabel : function (character, row, column) {
						return column;
					}
				},
				legend : { //Definition legend
					node : $('#legend'),
					items : [
						[ 'a', 'available',   'Available' ],
						[ 'a', 'unavailable', 'Unavailable'],
						[ 'a', 'selected', 'selected'],
					]					
				},
				click: function () { //Click event
					if (this.status() == 'available') { //optional seat
						$('<li>R'+(this.settings.row+1)+' S'+this.settings.label+'</li>')
							.attr('id', 'cart-item-'+this.settings.id)
							.data('seatId', this.settings.id)
							.appendTo($cart);
	
						$counter.text(sc.find('selected').length+1);
						$total.text(recalculateTotal(sc)+price);
									
						return 'selected';
					} else if (this.status() == 'selected') { //Checked
							//Update Number
							$counter.text(sc.find('selected').length-1);
							//update totalnum
							$total.text(recalculateTotal(sc)-price);
								
							//Delete reservation
							$('#cart-item-'+this.settings.id).remove();
							//optional
							return 'available';
					} else if (this.status() == 'unavailable') { //sold
						return 'unavailable';
					} else {
						return this.style();
					}
				}
			});
			//sold seat
			sc.get(['2_9', '2_11', '2_12','2_13','2_14','2_15','2_10','3_11','3_12','3_13',]).status('unavailable');
				
		});*/
	//sum total money
	function recalculateTotal(sc) {
		var total = 0;
		sc.find('selected').each(function () {
			total += price;
		});
				
		return total;
	}