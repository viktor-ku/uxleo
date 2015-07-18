
// portfolio all stuff

var sectionPortfolio = document.getElementById('portfolio');
var items = sectionPortfolio.getElementsByClassName('item');

for (var i = items.length - 1; i >= 0; i--) {

	items[i].addEventListener('mouseenter', function() {
		// add class 'hovered'
		var item = this;
		var hoveredImage = item.getElementsByTagName('img')[0];
		var overlay = item.getElementsByClassName('overlay')[0];

		hoveredImage.classList.add('hovered');
		overlay.classList.add('show');
	});

	items[i].addEventListener('mouseleave', function() {
		// remove class 'hovered'
		var item = this;
		var hoveredImage = item.getElementsByTagName('img')[0];
		var overlay = item.getElementsByClassName('overlay')[0];

		hoveredImage.classList.remove('hovered');
		overlay.classList.remove('show');
	});

	var buttons = items[i].getElementsByTagName('button');
	for (var b = buttons.length - 1; b >= 0; b--) {
		buttons[b].addEventListener('click', function(e) {
			var dataOutlet = this.dataset.outlet;
			var modal = document.getElementById(dataOutlet);

			if (modal === null) {
				console.error('No match modal here!' + ' => ' + modal);
			} else {
				modal.classList.add('show-modal');
			}

			document.body.classList.add('no-scroll');

			var closeBtn = modal.getElementsByClassName('modal-close')[0];

			closeBtn.addEventListener('click', function() {
				modal.classList.remove('show-modal');
				document.body.classList.remove('no-scroll');
			});

			modal.addEventListener('click', function(e) {
				if (e.target === this) {
					modal.classList.remove('show-modal');
					document.body.classList.remove('no-scroll');
				}
			});
		});
	};

};

// smooth scroll stuff

var navLinks = document.getElementById('navigation').childNodes;

var section = {
	about: document.getElementById('welcome'),
	service: document.getElementById('ux-engineering'),
	value: document.getElementById('front-end-sol'),
	portfolio: document.getElementById('portfolio'),
	me: document.getElementById('persona'),
	contact: document.getElementById('tallinn')
};

for (var i = navLinks.length - 1; i >= 0; i--) {
	navLinks[i].onclick = function(e) {
		e.preventDefault();
		var href = this.pathname.slice(1);
		var dest = section[href].id;
		scroll.to(dest);
	};
};