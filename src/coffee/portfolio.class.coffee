
class Portfolio extends Helpers

	constructor: () ->

	openModal: ->
		outlet = @.dataset.outlet
		modal = document.getElementById outlet
		

	itemEnter: ->
		overlay = @.querySelector('.overlay')
		img = @.querySelector('img')
		TweenLite.to overlay, .3,
			opacity: 1
			ease: Power2.easeOut
		TweenLite.to img, .3,
			scale: 1.15
			ease: Power2.easeOut

	itemLeave: ->
		overlay = @.querySelector('.overlay')
		img = @.querySelector('img')
		TweenLite.to overlay, .3,
			opacity: 0
			ease: Power2.easeOut
		TweenLite.to img, .3,
			scale: 1
			ease: Power2.easeOut
