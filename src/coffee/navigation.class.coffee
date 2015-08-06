
class Navigation extends Helpers

	constructor: ->
		@navigation = document.getElementById 'nav'
		@allLinks = @navigation.getElementsByTagName 'a'
		@getLinkByTarget('about').burn()

	drop: ->
		for link in @allLinks
			link.classList.remove 'active'

	burn: ->
		do @drop
		@.element.classList.add 'active'

	scroll: (posY) ->
		TweenLite.to window, 1, { scrollTo: { y: posY }, ease: Power4.easeInOut }

	clicker: (e) ->
		do e.preventDefault
		target = e.target.dataset.navTarget
		@scroll document.getElementById(target).offsetTop
		@getLinkByTarget(target).burn()
		do @closeMobileNav
		
	section: (sectionId) ->
		document.getElementById(sectionId).offsetTop

	wheelHandler: ->
		scrolled = window.pageYOffset or window.scrollY or document.documentElement.scrollTop

		if scrolled >= @section('about') and scrolled < @section('service') 	then @getLinkByTarget('about').burn()
		if scrolled >= @section('service') and scrolled < @section('value') 	then @getLinkByTarget('service').burn()
		if scrolled >= @section('value') and scrolled < @section('portfolio') 	then @getLinkByTarget('value').burn()
		if scrolled >= @section('portfolio') and scrolled < @section('me') 		then @getLinkByTarget('portfolio').burn()
		if scrolled >= @section('me') and scrolled < @section('contact') 		then @getLinkByTarget('me').burn()
		if scrolled >= @section('contact') 										then @getLinkByTarget('contact').burn()

	wheelRouteInit: ->
		window.addEventListener 'mousewheel', @wheelHandler.bind @
		window.addEventListener 'DOMMouseScroll', @wheelHandler.bind @

	openMobileNav: ->
		@navigation.classList.add 'show-nav'

	closeMobileNav: ->
		@navigation.classList.remove 'show-nav'

	touchlogo: (e) ->
		do @openMobileNav