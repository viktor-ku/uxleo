var debug_mode = true;

var debug = function(complex) {
	if (debug_mode) {
		if (typeof complex === 'function') {
			complex();
		} else {
			console.log(complex);
			console.log('=> ' + typeof complex);
		}
	}
};

