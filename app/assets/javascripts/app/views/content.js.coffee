class App.Views.Content extends Backbone.View

	className: "row"

	template: HandlebarsTemplates['app/templates/content']

	render:->
		@$el.html(@template())
		@renderEmptyView()
		@

	renderEmptyView: ->
		v = new App.Views.Empty()
		@$('#left-area div').html(v.render().el)
		@