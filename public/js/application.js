function resizeBackground() {
	var height = $('.front').css('height');
	$('.background').css('height', height);
}

function setFocusToUsernameInput() {
	document.getElementById('username_input').focus()
}

$(document).ready(function() {

	resizeBackground();


	
	$('#signin').on('click', function(event) {
		event.preventDefault();
		var submitButton = {action: '/login', button: 'Log in'};
		$.post('/signform', submitButton, function(response) {
			$('#signregisterform').html(response);
			$('#signregisterform').css('border-top', 'opx dotted #333');
			resizeBackground();
			setFocusToUsernameInput()
		});
		
	});

	$('#register').on('click', function(event) {
		event.preventDefault();
		var submitButton = {action: '/register', button: 'Register'};
		$.post('/signform', submitButton, function(response) {
			$('#signregisterform').html(response);
			$('#signregisterform').css('border-top', '0px dotted #333');
			resizeBackground();
			setFocusToUsernameInput()
		});
		
	});

	$('#addquestion').change(function(event) {
		event.preventDefault();
		var num = $('#addquestion option:selected').text();
		$('.choice').remove();
		for(i=0; i<num; i++) {
				$("#makesurveyformsubmit").before("<div class='label_div'><label class='choice' for='question1[options[option"+(i+1)+"]'>Choice "+(i+1)+":</label></div><div class='input_div'><input class='choice' type='text' name='question1[options[option"+(i+1)+"]' placeholder='Enter choice here.'></div><br><br>");
		}
	});

	$('#makesurveyform').on('submit', function(event) {
		event.preventDefault();
		var data = $(this).serialize();
		var url = '/add_survey'
		$.post(url, data, function() {
			var div = $("#survey_complete")
			$(div).css("display", "block");
		});
	});
});
