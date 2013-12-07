class App.Views.EditWorkout extends Backbone.ModalView

	name: "EditWorkout"
	model: App.Models.Workout

	template: HandlebarsTemplates['app/templates/editWorkout']

	render: ->
		@$el.html(@template())
		@