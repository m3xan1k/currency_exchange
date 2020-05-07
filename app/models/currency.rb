class Currency < ApplicationRecord
  validate :name, presence: true
  validate :rate, presence: true
end
