$(document).ready(function() {
	$('#signin').on('click', function(event) {
		event.preventDefault();
		var submitButton = {action: '/login', button: 'Log in'}
		$.post('/signform', submitButton, function(response) {
			$('#signform').html(response);
		});
	});

	$('#register').on('click', function(event) {
		event.preventDefault();
		var submitButton = {action: '/register', button: 'Register'}
		$.post('/signform', submitButton, function(response) {
			$('#signform').html(response);
		});
	});

	$('#addquestion').change(function(event) {
		event.preventDefault();
		var num = $('#addquestion option:selected').text();
		$('.choice').remove();
		for(i=0; i<num; i++) {
				$("#makesurveyformsubmit").before("<label class='choice' for='question1[option"+(i+1)+"]'>Choice "+(i+1)+": <input class='choice' type='text' name='question1[option"+(i+1)+"]' placeholder='Enter choice here.'><br></label>");
		}
	});

	$('#makesurveyform').on('submit', function() {
		var data = $(this).serialize();
			// $.post('/add_survey', data, function(response) {

	});
});
