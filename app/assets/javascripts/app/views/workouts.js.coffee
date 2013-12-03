class App.Views.Workouts extends Backbone.View

	template: HandlebarsTemplates['app/templates/workouts']

	events:
		"click button#new-workout": "newWorkout"
		"click button#save-workout": "saveWorkout"


	newWorkout: ->
		$('#effect').show('slide',{direction:'up'}, 500)
		# @model = new App.Models.Workout

	saveWorkout: (e) ->
		e.preventDefault()
		@model.set name: @$('#name').val()
		@model.set time: @$('#date').val()
		@model.save()
		$('#effect').hide('slide',{direction:'down'}, 500)

	initialize: ->
		@model = new App.Models.Workout
		@listenTo @collection, "reset", @render
		@listenTo @model, "sync", @triggerWorkoutCreate
		@listenTo App.Vent, "workout:create", @addToCollection
		@listenTo @collection, "add", @render
		@collection.fetch({ reset: true })

	triggerWorkoutCreate: ->
		App.Vent.trigger "workout:create", @model

	addToCollection: (model) ->
		@collection.add model

	render:->
		@$el.html(@template())
		@collection.forEach @renderWorkout, @
		@$( "#accordion" ).accordion({
		  collapsible: true,
		  active: false,
		  heightStyle: "content",
		  icons: null
		})

		$( "#datepicker" ).datepicker({
			dateFormat: "d.m.D",
			altField: "#date",
			altFormat: "yy-mm-ddT12:00:00.000Z"
		})
		$('#effect').hide()
		@

	renderWorkout: (model) ->
		v = new App.Views.Workout({ model: model })
		@$('#accordion').prepend("<div>"+model.toJSON().name+" details here</div>")
		@$('#accordion').prepend(v.render().el)