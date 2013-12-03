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
		id = modelJSON.id
		date = moment(modelJSON.time).format('MM.DD')
		day =  moment(modelJSON.time).format('ddd')
		name = modelJSON.name
		modelJSON_fmtd = { "id": id, "name": name, "date": date, "day": day }
		@$el.html(@template(modelJSON_fmtd))
		datepickerSelector = "#datepicker"+id
		$( "#datepicker" ).datepicker({
			dateFormat: "d.m.D",
			altField: "#date",
			altFormat: "yy-mm-ddT12:00:00.000Z"
		})
		@