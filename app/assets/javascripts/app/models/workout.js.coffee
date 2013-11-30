class App.Models.Workout extends Backbone.Model

class App.Collections.Workouts extends Backbone.Collection
	model: App.Models.Workout
	url: "/workouts"