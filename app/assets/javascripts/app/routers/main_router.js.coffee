class App.Routers.MainRouter extends Backbone.Router

	routes:
		"": "index"

	initialize: ->
		@contentView = new App.Views.Content()

	index: ->
		$('#content').html(@contentView.render().el)