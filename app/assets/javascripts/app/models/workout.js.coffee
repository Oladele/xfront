class App.Models.Workout extends Backbone.Model
	url: "/workouts"

class App.Collections.Workouts extends Backbone.Collection
	model: App.Models.Workout
	url: "/workouts"