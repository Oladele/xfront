class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.datetime :time

      t.timestamps
    end
  end
end
