class App.Views.Workout extends Backbone.View

	template: HandlebarsTemplates['app/templates/workout']

	initialize: ->
		@listenTo @model, 'destroy', @remove
	
	events:
		"click button#delete-workout": "deleteWorkout"
		"click button#edit-workout": "editWorkout"

	editWorkout: -> App.Vent.trigger "workout:edit", @model

	deleteWorkout: ->
		return unless confirm ("Are you sure?")
		@model.destroy()

	render: ->
		modelJSON = @model.toJSON()
		id = modelJSON.id
		date = moment(modelJSON.time).format('MM.DD')
		day =  moment(modelJSON.time).format('ddd')
		name = modelJSON.name
		modelJSON_fmtd = { "id": id, "name": name, "date": date, "day": day }
		@$el.html(@template(modelJSON_fmtd))
		@