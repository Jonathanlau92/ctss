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

#student_attributes = [
#  { personal_consent: true, full_name: "Tom", school_email: "ray.tan180@gmail.com", sex: 1, subject_preferences: {} ,education_level: 1, parental_consent: true, match_count: 1  },
#  { personal_consent: true, full_name: "Susan", school_email: "ray.tan180@gmail.com", sex: 1, subject_preferences: {} ,education_level: 2, parental_consent: true, match_count: 1  }
#] 

#student_attributes.each do |attributes|
#  Student.where(attributes).first_or_create
#end

#tutor_attributes = [
#  { personal_consent: true, full_name: "Thompson", school_email: "ray.tan180@gmail.com", sex: 1, subjects: "", hours_to_teach: 10, match_count: 1  },
#  { personal_consent: true, full_name: "Sally", school_email: "ray.tan180@gmail.com", sex: 1, subjects: "", hours_to_teach: 10, match_count: 1  }
#] 

#tutor_attributes.each do |attributes|
#  Tutor.where(attributes).first_or_create
#end