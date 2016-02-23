# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'phwener@gmail.com', username: 'pwener', password: '12345678', password_confirmation: '12345678')
User.create(email: 'vlisboan@gmail.com', username: 'vlisboan', password: '12345678', password_confirmation: '12345678')

EventType.create(name: 'Food', points: 1, description: 'Healthy food')
EventType.create(name: 'Junk food', points: -2, description: 'Almost always delicious...')
EventType.create(name: 'Sport', points: 4, description: 'Physical practices')
EventType.create(name: 'Drugs', points: -5, description: 'This includes alcohol, cigarette')
