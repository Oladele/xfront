class App.Models.Workout extends Backbone.Model
	urlRoot: "/workouts"

class App.Collections.Workouts extends Backbone.Collection
	model: App.Models.Workout
	url: "/workouts"