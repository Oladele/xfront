class App.Views.Workouts extends Backbone.View

	template: HandlebarsTemplates['app/templates/workouts']

	render:->
		@$el.html(@template())
		@