class Ingredient < ApplicationRecord
	has_many :cocktails, through: :doses 
	validates :name, uniqueness: true
	validates :name, presence: true
end
