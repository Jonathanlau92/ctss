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
    email: Field::String,
    alternate_email: Field::String,
    sex: Field::String.with_options(searchable: false),
    subject_preferences: Field::JSONB,
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
    existing_educational_level_data: Field::String,
    feedbacks: Field::HasMany,
    matched: Field::Boolean,
    sent_intro_email: Field::Boolean,
    specific_level: Field::String.with_options(searchable: false),
    give_out_contact: Field::Boolean,
    special_request: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  full_name
  email
  sex
  education_level
  specific_level
  contact_number
  subject_1
  subject_2
  subject_3
  others_subject
  special_request
  feedbacks
  match_count
  matched
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  personal_consent
  full_name
  email
  alternate_email
  sex
  education_level
  contact_number
  subject_preferences
  parental_consent
  match_count
  subject_1
  subject_2
  subject_3
  others_subject
  matched
  sent_intro_email
  give_out_contact
  special_request
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  personal_consent
  full_name
  email
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
  matched
  sent_intro_email
  give_out_contact
  special_request
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
  def display_resource(student)
    "#{student.full_name} - #{student.id}"
  end
end
