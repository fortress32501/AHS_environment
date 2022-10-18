# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(first_name: "Tim", last_name: "Jones", email: "tim@email.com", password: "12345", point: "200", is_admin: true)
# User.create(first_name: "Jane", last_name: "White", email: "jane@email.com", password: "123", point: "1000", is_admin: false)
# User.create(first_name: "John", last_name: "Jones", email: "john@email.com", password: "123456", point: "500", is_admin: true)
# User.create(first_name: "James", last_name: "White", email: "james@email.com", password: "1234", point: "800", is_admin: false)


# Ranking.create(title: "Diamond", point_total: "1000")
# Ranking.create(title: "Gold", point_total: "700")
# Ranking.create(title: "Silver", point_total: "500")
# Ranking.create(title: "Bronze", point_total: "100")

User.create!([
  {first_name: "Test", last_name: "Test", email: "test@gmail.com", password_digest: "$2a$12$7wDlUndiAVVpEMSStsZkA./R8PMWYE3okaP7gVJkSXI00vdslmQZG", point: 0, is_admin: true, ranking_id: nil}
])
