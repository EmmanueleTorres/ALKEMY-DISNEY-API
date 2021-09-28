class Cast < ApplicationRecord
  belongs_to :character
  belongs_to :film
  validates :character_id, uniqueness: { scope: :film_id, message: "Ya está en esta película"}
end
