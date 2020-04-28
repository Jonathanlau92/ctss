require "administrate/base_dashboard"

class StudentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    personal_consent: Field::Boolean,
    full_name: Field::String,
    school_email: Field::String,
    alternate_email: Field::String,
    sex: Field::String.with_options(searchable: false),
    subject_preferences: Field::String.with_options(searchable: false),
    education_level: Field::String.with_options(searchable: false),
    parental_consent: Field::Boolean,
    match_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    subject_1: Field::String,
    subject_2: Field::String,
    subject_3: Field::String,
    others_subject: Field::String,
    contact_number: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  personal_consent
  full_name
  school_email
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  personal_consent
  full_name
  school_email
  alternate_email
  sex
  subject_preferences
  education_level
  parental_consent
  match_count
  created_at
  updated_at
  subject_1
  subject_2
  subject_3
  others_subject
  contact_number
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  personal_consent
  full_name
  school_email
  alternate_email
  sex
  subject_preferences
  education_level
  parental_consent
  match_count
  subject_1
  subject_2
  subject_3
  others_subject
  contact_number
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how students are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(student)
  #   "Student ##{student.id}"
  # end
end
