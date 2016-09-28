
$(document).ready(function(){

		$('form').on('click', '.add_fields', function(event) {
		  var regexp, time;
		  time = new Date().getTime();
		  regexp = new RegExp($(this).data('id'), 'g');
		  $(this).after($(this).data('fields').replace(regexp, time));
		  return event.preventDefault();
		});

	$( "#from_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
		selectOtherMonths: false,
		//isRTL:true,
	});
	$( "#to_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
		selectOtherMonths: false,
		//isRTL:true,
	});

	$('#file').ace_file_input({
		no_file:'No File ...',
		btn_choose:'Choose',
		btn_change:'Change',
		droppable:false,
		onchange:null,
		thumbnail:false //| true | large
		//whitelist:'gif|png|jpg|jpeg'
		//blacklist:'exe|php'
		//onchange:''
		//
	});


	$('#select_date').datepicker({dateFormat: "yy-mm-dd",
	onClose: function(input, inst) {
		a = 1.0;
		b= 20;
		$('.daily_report').empty().append("<div class='progress progress-striped active'><div class='bar' style='width: 0%;'></div></div>").delay(1000);
	},
	onSelect: function(selectedDate) {
		$.get('/daily_report?date='+selectedDate, function(data){
		  $('.daily_report').empty().append(data);
		});
	}
});

	$('#select_month').datepicker( {
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		dateFormat: "yy-mm-dd",
		onSelect: function(selectedMonth) {
		},
		onClose: function(dateText, inst) {
			var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
			var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
			$(this).datepicker('setDate', new Date(year, month, 1));
			$.get('/monthly_report?date='+this.value, function(data){
			  $('.monthly_report').empty().append(data);
			});
		}
	});

	$('#from_month').datepicker( {dateFormat: "yy-mm-dd" });
	$('#to_month').datepicker( {dateFormat: "yy-mm-dd" });







 	$('#close_date').datepicker({dateFormat: 'yy-mm-dd'});


 	$('#date_picker_close').datepicker();

	$('[data-rel=tooltip]').tooltip();




	$('#bootbox-regular').on('click', function(){
bootbox.confirm("<form id='infos' action=''>\
    Discount Amount: <input type='text' id='amt'></input><br/><br/>\
    Discount Percent: <input type='text' id='percent'></input><br/>\
    <p>Please Add any one</p>\
    </form>", function(result) {
			if (result === null) {
				//alert("Prompt dismissed");
			}
			else {
				if ($('#amt').val() != '') {
					var tsprice = $('#total_sale_price').text();
					$('#sale_discount').val(parseFloat($('#amt').val()) * 100 / parseFloat(tsprice));
					calculate_total(tsprice);
					$('#temp_discount').val($('#amt').val());
					$('#temp_discount').css('display','block');

				}
				else if ($('#percent').val() != '') {
					var tsprice = $('#total_sale_price').text();
					$('#sale_discount').val($('#percent').val());
					calculate_total(tsprice);
					$('#temp_discount').val($('#percent').val());
					$('#temp_discount').css('display','block');
				}
			}
		});
	});

		$('#bootbox-vat').on('click', function(){
		bootbox.confirm("<form id='infos' action=''>\
    VAT Percent : <input type='text' id='modal_vat'></input><br/><br/>\
    </form>", function(result) {
			if (result === null) {
				//alert("Prompt dismissed");
			}
			else {
				if ($('#modal_vat').val() != '') {
					$('#sale_vat').val($('#modal_vat').val());
					var tsprice = parseFloat($('#total_sale_price').text());
					calculate_total(tsprice);
					$('#sale_vat').css('display','block');

				}
			}
		});
		});

});
