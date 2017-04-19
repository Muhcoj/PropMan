require "administrate/base_dashboard"

class FinanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    year: Field::String,
    month: Field::String,
    gas: Field::String.with_options(searchable: false),
    water: Field::String.with_options(searchable: false),
    electricity: Field::String.with_options(searchable: false),
    payment_due: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :year,
    :month,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :year,
    :month,
    :gas,
    :water,
    :electricity,
    :payment_due,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :year,
    :month,
    :gas,
    :water,
    :electricity,
    :payment_due,
  ].freeze

  # Overwrite this method to customize how finances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(finance)
  #   "Finance ##{finance.id}"
  # end
end
