
class Navigation extends Helpers

	constructor: ->

	clickLink: (e) ->
		do e.preventDefault
		target = document.getElementById @.hash[1...]
		targetOffset = target.offsetTop

		TweenLite.to(window, 1, {scrollTo:{y:targetOffset}, ease:Power2.easeInOut})

		for link in @.parentElement.children
			link.classList.remove 'active'

		@.classList.add 'active'
