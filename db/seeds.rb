# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Wfile.destroy_all

file_1 = Wfile.new(
  name: 'root',
  is_dir: true,
  owner: 'root'
)
file_2= Wfile.new(
  name: 'in_root',
  is_dir: true,
  owner: 'user'
)
file_3 = Wfile.new(
  name: 'in_root',
  is_dir: true,
  owner: 'user'
)
file_4 = Wfile.new(
  name: 'in_in_root',
  is_dir: true,
  owner: 'user'
)
file_5 = Wfile.new(
  name: 'in_in_in_root',
  is_dir: true,
  owner: 'user'
)
file_1.children << file_2
file_1.children << file_3
file_3.children << file_4
file_4.children << file_5

file_1.save
file_2.save
file_3.save
file_4.save
file_5.save
