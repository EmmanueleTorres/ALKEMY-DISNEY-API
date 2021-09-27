class Character < ApplicationRecord
  has_many :casts
  has_one_attached :photo

  validates :name, uniqueness: true, presence: :true
  validates :history, length: { minimum: 6 }

end
