class Character < ApplicationRecord
  validates :name, uniqueness: {case_sensitive: false}
  has_one_attached :photo
end
