class App.Routers.MainRouter extends Backbone.Router

	routes:
		"": "index"
		"workouts": "workout"

	initialize: ->
		@contentView = new App.Views.Content()

	index: ->
		@layoutViews()

	workout: ->
		@layoutViews()

	layoutViews: ->
		$('#content').html(@contentView.render().el)
