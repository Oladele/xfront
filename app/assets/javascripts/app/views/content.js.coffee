class App.Views.Content extends Backbone.View

	className: "row"

	template: HandlebarsTemplates['app/templates/content']

	render:->
		@$el.html(@template())
		@renderEmptyView()
		@renderWorkoutsView()
		@

	renderEmptyView: ->
		v = new App.Views.Empty()
		@$('#left-area div').html(v.render().el)
		@

	renderWorkoutsView: ->
		v = new App.Views.Workouts()
		@$('#right-area').html(v.render().el)
		@