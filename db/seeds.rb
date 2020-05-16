# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create(content: 'Task 1',status: 'ステータス 1')
Task.create(content: 'Task 2',status: 'ステータス 2')
Task.create(content: 'Task 3',status: 'ステータス 3')

(1..100).each do |number|
     Task.create(content: 'task'+number.to_s, status: 'status'+number.to_s)
 end