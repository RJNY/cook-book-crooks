class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :name, length: {in: 3..140}
end
