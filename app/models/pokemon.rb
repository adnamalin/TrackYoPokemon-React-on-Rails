class Pokemon < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :cp, presence: true
end
