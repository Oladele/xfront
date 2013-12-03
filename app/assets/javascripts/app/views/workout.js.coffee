class App.Views.Workout extends Backbone.View

	template: HandlebarsTemplates['app/templates/workout']

	initialize: ->
		@listenTo @model, 'destroy', @remove
	
	events:
		"click button#delete-workout": "deleteWorkout"

	deleteWorkout: ->
		return unless confirm ("Are you sure?")
		@model.destroy()

	render: ->
		modelJSON = @model.toJSON()
		date = moment(modelJSON.time).format('MM.DD')
		day =  moment(modelJSON.time).format('ddd')
		name = modelJSON.name
		modelJSON_fmtd = { "name": name, "date": date, "day": day }
		@$el.html(@template(modelJSON_fmtd))
		@