class App.Views.Workout extends Backbone.View

	template: HandlebarsTemplates['app/templates/workout']

	render: ->
		modelJSON = @model.toJSON()
		date = moment(modelJSON.time).format('MM.DD')
		day = moment(modelJSON.time).format('ddd')
		name = modelJSON.name
		model_fmtd = { "name": name, "date": date, "day": day }
		@$el.html(@template(model_fmtd))
		@