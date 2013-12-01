class App.Views.Workouts extends Backbone.View

	template: HandlebarsTemplates['app/templates/workouts']

	events:
		"click button#new-workout": "newWorkout"
		"click button#save-workout": "saveWorkout"

	newWorkout: ->
		# console.log 'you clicked me'
		$('#effect').show('slide',{direction:'up'}, 500)
		@model = new App.Models.Workout

	saveWorkout: (e) ->
		e.preventDefault()
		@model.set name: @$('#name').val()
		@model.set time: @$('#date').val()
		console.log @model.toJSON()
		@model.save()
		$('#effect').hide('slide',{direction:'down'}, 500)

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
		# $('#new-workout').click(->
		# 	$('#effect').show('slide',{direction:'up'}, 500)
		# 	return false
		# )
		# $('#save-workout').click(->
		# 	$('#effect').hide('slide',{direction:'down'}, 500)
		# 	return false
		# 	)
		$( "#datepicker" ).datepicker({
			dateFormat: "d.m.D",
			altField: "#date",
			altFormat: "yy-mm-ddT00:00:00.000Z"
		})
		$('#effect').hide()
		@

	renderWorkout: (model) ->
		v = new App.Views.Workout({ model: model })
		@$('#accordion').append(v.render().el)
		@$('#accordion').append("<div>workout details here</div>")