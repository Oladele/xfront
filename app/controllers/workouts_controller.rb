class WorkoutsController < ApplicationController
	respond_to :json

	def index
		respond_with(Workout.all)
	end

	def create
		workout = Workout.new(workout_params)
		workout.save
		respond_with(workout)
	end

	private

	def workout_params
		params.require(:workout).permit(:name, :time)
	end
end

