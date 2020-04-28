require "administrate/base_dashboard"

class TutorDashboard < Administrate::BaseDashboard
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
    sex: Field::Number,
    subjects: Field::String.with_options(searchable: false),
    hours_to_teach: Field::Number,
    match_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    qualification: Field::String,
    past_experiences: Field::Text,
    reason_for_volunteering: Field::Text,
    level_to_teach: Field::String,
    code_of_conduct: Field::Boolean,
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
  subjects
  hours_to_teach
  match_count
  created_at
  updated_at
  qualification
  past_experiences
  reason_for_volunteering
  level_to_teach
  code_of_conduct
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
  subjects
  hours_to_teach
  match_count
  qualification
  past_experiences
  reason_for_volunteering
  level_to_teach
  code_of_conduct
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

  # Overwrite this method to customize how tutors are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tutor)
  #   "Tutor ##{tutor.id}"
  # end
end