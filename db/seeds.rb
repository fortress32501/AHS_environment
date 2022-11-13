# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Ranking.create(title: "Diamond", point_total: "1000")
Ranking.create(title: "Gold", point_total: "700")
Ranking.create(title: "Silver", point_total: "500")
Ranking.create(title: "Bronze", point_total: "100")
Ranking.create(title: "Iron", point_total: "0")

Event.create!([
  {event_points: 10, event_description: "Event 1 Description", event_passcode: "password", event_start: "2022-11-07 16:22:00", event_end: "2022-11-07 16:22:00", event_title: "Event 1", event_location: "Zoom", event_type_id: "1"},
  {event_points: 20, event_description: "Event 2 Description", event_passcode: "password2", event_start: "2022-11-08 16:23:00", event_end: "2022-11-08 16:23:00", event_title: "Event 2", event_location: "Zoom", event_type_id: "2"},
  {event_points: 15, event_description: "Event 3 Description", event_passcode: "password3", event_start: "2022-11-10 16:23:00", event_end: "2022-11-10 16:23:00", event_title: "Event 3", event_location: "Zoom", event_type_id: "3"},
  {event_points: 5, event_description: "Event 4 Description", event_passcode: "password4", event_start: "2022-11-15 16:23:00", event_end: "2022-11-15 16:23:00", event_title: "Event 4", event_location: "Zoom", event_type_id: "4"},
  {event_points: 10, event_description: "Event 5 Description", event_passcode: "password5", event_start: "2022-11-23 16:23:00", event_end: "2022-11-23 16:23:00", event_title: "Event 5", event_location: "Zoom", event_type_id: "1"},
  {event_points: 20, event_description: "Event 6 Description", event_passcode: "password6", event_start: "2022-11-13 16:23:00", event_end: "2022-11-14 16:23:00", event_title: "Event 6", event_location: "Zoom", event_type_id: "2"},
  {event_points: 10, event_description: "Event 7 Description", event_passcode: "password7", event_start: "2022-11-29 16:23:00", event_end: "2022-11-29 16:23:00", event_title: "Event 7", event_location: "Zoom", event_type_id: "3"}
])
EventType.create!([
  {type_name: "General Meeting", description:"Bi-weekly org update meetings", color: "#615fde"},
  {type_name: "Workshop", description: "Weekly workshops held by officers", color: "#d58bd9"},
  {type_name: "Social", description: "Social gathering events", color: "#98eba5"},
  {type_name: "Volunteering", description: "Volunteering events across Bryan/College Station", color: "#f0da9e"}
])
User.create!([
  {first_name: "Test", last_name: "Test", email: "test@gmail.com", password_digest: "$2a$12$7wDlUndiAVVpEMSStsZkA./R8PMWYE3okaP7gVJkSXI00vdslmQZG", point: 0, is_admin: true, ranking_id: nil}
])
User.create!([
  {first_name: "Pear", last_name: "Ratano", email: "pear@gmail.com", password: "123", point: 0, is_admin: false, ranking_id: nil}
])


User.create(first_name: "max", last_name: "Jones", email: "max@email.com", password: "12345", point: "200", is_admin: true)
User.create(first_name: "ruby", last_name: "White", email: "ruby@email.com", password: "123", point: "1000", is_admin: false)
User.create(first_name: "Tim", last_name: "Jones", email: "tim@email.com", password: "12345", point: "200", is_admin: true)
User.create(first_name: "Jane", last_name: "White", email: "jane@email.com", password: "123", point: "1000", is_admin: false)
User.create(first_name: "John", last_name: "Jones", email: "john@email.com", password: "123456", point: "500", is_admin: true)
User.create(first_name: "James", last_name: "White", email: "james@email.com", password: "1234", point: "800", is_admin: false)
User.create(first_name: "max", last_name: "Jones", email: "max@email.com", password: "12345", point: "700", is_admin: true)
User.create(first_name: "ruby", last_name: "White", email: "ruby@email.com", password: "123", point: "1400", is_admin: false)
User.create(first_name: "Tim", last_name: "Jones", email: "tim@email.com", password: "12345", point: "100", is_admin: true)
User.create(first_name: "Jane", last_name: "White", email: "jane@email.com", password: "123", point: "100", is_admin: false)
User.create(first_name: "John", last_name: "Jones", email: "john@email.com", password: "123456", point: "900", is_admin: true)
User.create(first_name: "James", last_name: "White", email: "james@email.com", password: "1234", point: "800", is_admin: false)
