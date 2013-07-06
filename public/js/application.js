$(document).ready(function() {
	$('#signin').on('click', function(event) {
		event.preventDefault();
		var submitButton = {action: '/login', button: 'Log in'};
		$.post('/signform', submitButton, function(response) {
			$('#signregisterform').html(response);
		});
	});

	$('#register').on('click', function(event) {
		event.preventDefault();
		var submitButton = {action: '/register', button: 'Register'};
		$.post('/signform', submitButton, function(response) {
			$('#signregisterform').html(response);
		});
	});
});
