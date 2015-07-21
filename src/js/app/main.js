

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

var navLinks = document.getElementById('nav').children;
var toContactBtn = document.getElementById('to-contact');

var section = {
	about: document.getElementById('about'),
	service: document.getElementById('service'),
	value: document.getElementById('value'),
	portfolio: document.getElementById('portfolio'),
	me: document.getElementById('me'),
	contact: document.getElementById('contact'),
	offsetTop: function(data) {
		if (typeof data === 'string') {
			switch(data) {
				case 'about':
					return this.about.offsetTop;
				case 'service':
					return this.service.offsetTop;
				case 'value':
					return this.value.offsetTop;
				case 'portfolio':
					return this.portfolio.offsetTop;
				case 'me':
					return this.me.offsetTop;
				case 'contact':
					return this.contact.offsetTop;
				default:
					return debug(data)
			}
		}
	},
};

var searchLinkByHash = function(data) {
	for (var z = navLinks.length - 1; z >= 0; z--) {
		if (navLinks[z].hash.slice(1) === data) {
			return navLinks[z];
		}
	};
};

var link = {
	about: searchLinkByHash('about'),
	service: searchLinkByHash('service'),
	value: searchLinkByHash('value'),
	portfolio: searchLinkByHash('portfolio'),
	me: searchLinkByHash('me'),
	contact: searchLinkByHash('contact'),
};

var switchNavigationTab = function(data) {
	if (data.className !== 'active') {
		for (var i = navLinks.length - 1; i >= 0; i--) {
			navLinks[i].classList.remove('active');
		};
		data.classList.add('active');
	}
};

var navigate = function(event, item) {
	if (!mobile.any()) {
		event.preventDefault();
		var dest = item.hash;
		var scrollOptions = { speed: 768, easing: 'easeInOutQuint', updateURL: false, offset: 50 };
		smoothScroll.animateScroll(null, dest, scrollOptions);
		return;
	}
	event.preventDefault();
	var dest = item.hash;
	var scrollOptions = { speed: 1024, easing: 'easeInOutQuart', updateURL: false, offset: 50 };
	smoothScroll.animateScroll(null, dest, scrollOptions);
	closeNavigation();
};

toContactBtn.addEventListener('click', function(e) {
	navigate(e, this);
	switchNavigationTab(link.contact);
});

for (var i = navLinks.length - 1; i >= 0; i--) {
	navLinks[i].addEventListener('click', function(e) {
		navigate(e, this);
		switchNavigationTab(this);
	});
};

document.addEventListener('wheel', function(e) {
	var scrolled = window.pageYOffset || document.documentElement.scrollTop;

	// if scrolled >= section offset from top
	if ((scrolled >= section.offsetTop('about')) && (scrolled < section.offsetTop('service'))) {
		switchNavigationTab(link.about);
	} else if ((scrolled >= section.offsetTop('service')) && (scrolled < section.offsetTop('value'))) {
		switchNavigationTab(link.service);
	} else if ((scrolled >= section.offsetTop('value')) && (scrolled < section.offsetTop('portfolio'))) {
		switchNavigationTab(link.value);
	} else if ((scrolled >= section.offsetTop('portfolio')) && (scrolled < section.offsetTop('me'))) {
		switchNavigationTab(link.portfolio);
	} else if ((scrolled >= section.offsetTop('me')) && (scrolled < section.offsetTop('contact'))) {
		switchNavigationTab(link.me);
	} else if (scrolled >= section.offsetTop('contact')) {
		switchNavigationTab(link.contact);
	}

});




var toggleIcon = document.getElementById('project-logo');

var navigation = document.getElementById('nav');

var openNavigation = function() {
	navigation.classList.add('show-nav');
};

var closeNavigation = function() {
	navigation.classList.remove('show-nav');
};

toggleIcon.addEventListener('tap', function(e) {
	if (navigation.className !== 'show-nav') {
		openNavigation();
	} else {
		closeNavigation();
	}
});