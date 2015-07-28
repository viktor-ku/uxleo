
class Portfolio

	constructor: (sectionNode) ->
		return if not sectionNode?
		@section = sectionNode
		@container = @section.getElementsByClassName('container')[0]
		@items = @container.getElementsByClassName 'item'
		@buttons = @container.getElementsByTagName('button')

		@hoverItem @itemMouseEnter, @itemMouseLeave
		do @toggleModal

		# console.log jQuery

	hoverItem: (mouseenter, mouseleave) ->
		for item in @items
			item.addEventListener 'mouseenter', mouseenter
			item.addEventListener 'mouseleave', mouseleave
		return

	toggleModal: ->
		for button in @buttons
			button.addEventListener 'click', ->
				modal = document.getElementById @.dataset.outlet
				closeButton = modal.getElementsByClassName('modal-close')[0]

				modal.classList.add 'show-modal'
				closeButton.addEventListener 'click', ->
					modal.classList.remove 'show-modal'
				modal.addEventListener 'click', (e) ->
					if e.target is @
						modal.classList.remove 'show-modal'
				return
		return

	itemMouseEnter: ->
		@.getElementsByTagName('img')[0].classList.add 'hovered'
		@.getElementsByClassName('overlay')[0].classList.add 'show'

	itemMouseLeave: ->
		@.getElementsByTagName('img')[0].classList.remove 'hovered'
		@.getElementsByClassName('overlay')[0].classList.remove 'show'


prtf = new Portfolio document.getElementById 'portfolio'
