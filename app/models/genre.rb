class Genre < ApplicationRecord
  has_many :films
  has_one_attached :photo
end
