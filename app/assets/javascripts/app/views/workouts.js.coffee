class App.Views.Workouts extends Backbone.View

	template: HandlebarsTemplates['app/templates/workouts']

	initialize: ->
		@listenTo @collection, "reset", @render
		@collection.fetch({ reset: true }) 

	render:->
		@$el.html(@template())
		@collection.forEach @renderWorkout, @
		@$( "#accordion" ).accordion({
		  collapsible: true,
		  active: false,
		  heightStyle: "content",
		  icons: null
		})
		@

	renderWorkout: (model) ->
		v = new App.Views.Workout({ model: model })
		@$('#accordion').append(v.render().el)
		@$('#accordion').append("<div>workout details here</div>")