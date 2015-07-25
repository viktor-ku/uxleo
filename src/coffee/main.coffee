
class Portfolio

	constructor: (sectionNode) ->
		return if not sectionNode?
		@section = sectionNode
		@container = @section.getElementsByClassName('container')[0]
		@items = @container.getElementsByClassName 'item'

		@hoverItemProcess @itemMouseEnter, @itemMouseLeave

	hoverItemProcess: (mouseenter, mouseleave) ->
		for item in @items
			item.addEventListener 'mouseenter', mouseenter
			item.addEventListener 'mouseleave', mouseleave
		return



	itemMouseEnter: ->
		@.getElementsByTagName('img')[0].classList.add 'hovered'
		@.getElementsByClassName('overlay')[0].classList.add 'show'

	itemMouseLeave: ->
		@.getElementsByTagName('img')[0].classList.remove 'hovered'
		@.getElementsByClassName('overlay')[0].classList.remove 'show'


prtf = new Portfolio document.getElementById 'portfolio'

