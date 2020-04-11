class Recipe < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belongs_to :user

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマは使えません') if name&.include?(',')
  end

end
