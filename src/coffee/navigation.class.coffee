
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
		TweenLite.to window, 1.25, { scrollTo: { y: posY }, ease: Power3.easeOut }

	clicker: (e) ->
		do e.preventDefault
		target = e.target.dataset.navTarget
		@scroll document.getElementById(target).offsetTop
		@getLinkByTarget(target).burn()
		