# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(email: 'admin@ctss.com', password: 'password')

match_attributes = [
  { student_id: 1, tutor_id: 1, existing_matching_id: "A1a", imported_data: "Nil"},
  { student_id: 2, tutor_id: 2, existing_matching_id: "NA1a", imported_data: "Nil"},
]

match_attributes.each do |attributes|
  Match.where(attributes).first_or_create
end

student_attributes = [
  { student_id: 1, tutor_id: 1, existing_matching_id: "A1a", imported_data: "Nil"},
  { student_id: 2, tutor_id: 2, existing_matching_id: "NA1a", imported_data: "Nil"},
]