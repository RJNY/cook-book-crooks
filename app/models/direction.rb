class Direction < ActiveRecord::Base
  belongs_to :recipe

  validates :step, length: { in: 3..140 }
end
