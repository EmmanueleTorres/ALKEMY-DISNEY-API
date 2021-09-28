class Film < ApplicationRecord
  has_many :casts, dependent: :destroy
  has_many :characters, through: :casts
  has_one_attached :photo
  belongs_to :genre

  validates :title, uniqueness: true, presence: :true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
