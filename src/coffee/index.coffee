
#= helpers.class.coffee
#= portfolio.class.coffee

portf = new Portfolio

portf.hover '.item', portf.itemEnter, portf.itemLeave

portf.click 'button[data-outlet]', portf.openModal
portf.click '.modal', portf.closeModal