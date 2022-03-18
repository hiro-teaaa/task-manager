# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'logger'
Label.destroy_all
Task.destroy_all
CSV.foreach('db/seed/labels.csv') do |row|
  Label.create(:label_name => row[0])
end

label_ids = Label.pluck(:id)
CSV.foreach('db/seed/tasks.csv') do |row|
  srand(43)
  Task.create(:task_name => row[0], :date_limit => row[1], :priority => row[2], :status => row[3], :label_ids => label_ids[rand(0..29)])
end