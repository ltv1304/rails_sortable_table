# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Wfile.new(
  name: 'root',
  is_dir: true,
  owner: 'root'
).save
Wfile.new(
  name: 'in_root',
  is_dir: true,
  owner: 'user',
  parent_id: 1
).save
Wfile.new(
  name: 'in_root',
  is_dir: true,
  owner: 'user',
  parent_id: 1
).save
Wfile.new(
  name: 'in_in_root',
  is_dir: true,
  owner: 'user',
  parent_id: 2
).save
Wfile.new(
  name: 'in_in_in_root',
  is_dir: true,
  owner: 'user',
  parent_id: 4
).save
