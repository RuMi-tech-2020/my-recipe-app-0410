class Recipe < ApplicationRecord
  validates :name, presence: true
  # validates :validate_name_not_including_comma

  belongs_to :user

end
