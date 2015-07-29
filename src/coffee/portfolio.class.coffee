
class Portfolio extends Helpers

	constructor: ->

	openModal: ->
		outlet = @.dataset.outlet
		modal = document.getElementById outlet
		modal.classList.add 'show-modal'		

	closeModal: (e) ->
		openedModal = document.querySelector '.modal.show-modal'
		if e.target is @ or e.target is openedModal.querySelector 'button.modal-close' 
			openedModal.classList.remove 'show-modal'

	itemEnter: ->
		overlay = @.querySelector '.overlay'
		overlay.classList.add 'show-overlay'

	itemLeave: ->
		overlay = @.querySelector '.overlay'
		overlay.classList.remove 'show-overlay'