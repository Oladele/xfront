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
		@listenTo App.Vent, "workout:edit", @editWorkout
		@listenTo @collection, "add", @render
		@collection.fetch({ reset: true })

	editWorkout: (model) ->
		v = new App.Views.EditWorkout({ model: model })
		v.render().showModal({
			fadeInDuration:150,
			fadeOutDuration:150,
			showCloseButton:false,
			targetContainer: document.body,
			slideFromAbove: false,
			slideFromBelow: false,
			slideDistance: 150,
			css:
    	{
        "display": "inline-table",
        "border": "2px solid rgba(255,255,255,.7)",
        "background-color": "rgba(0,0,0,.7)",
        "margin": "auto",
        "left": "50%"
        }})

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