class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true 
  validates :date, presence: true
  validates :cp, presence: true
end
