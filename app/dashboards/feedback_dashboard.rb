require "administrate/base_dashboard"

class FeedbackDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    student: Field::BelongsTo,
    tutor: Field::BelongsTo,
    id: Field::Number,
    matching_number: Field::String,
    full_name: Field::String,
    action: Field::Text,
    date_of_session: Field::Date,
    start_time: Field::Time,
    end_time: Field::Time,
    understand_concepts: Field::String,
    observe_code_of_conduct: Field::Boolean,
    elaborate: Field::String,
    topics_covered: Field::Text,
    comfortable_with_tutor: Field::Boolean,
    other_feedbacks: Field::Text,
    know_about_program: Field::JSONB,
    platform: Field::String,
    difficulties_with_tutoring: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    step: Field::String,
    identity: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  student
  tutor
  matching_number
  identity
  date_of_session
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  student
  tutor
  id
  matching_number
  full_name
  action
  date_of_session
  start_time
  end_time
  understand_concepts
  observe_code_of_conduct
  elaborate
  topics_covered
  comfortable_with_tutor
  other_feedbacks
  know_about_program
  platform
  difficulties_with_tutoring
  created_at
  updated_at
  step
  identity
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  student
  tutor
  matching_number
  full_name
  action
  date_of_session
  start_time
  end_time
  understand_concepts
  observe_code_of_conduct
  elaborate
  topics_covered
  comfortable_with_tutor
  other_feedbacks
  know_about_program
  platform
  difficulties_with_tutoring
  step
  identity
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

  # Overwrite this method to customize how feedbacks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(feedback)
  #   "Feedback ##{feedback.id}"
  # end
end
