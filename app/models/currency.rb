class Currency < ApplicationRecord
  validates :name, presence: true
  validates :rate, presence: true
end
