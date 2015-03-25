class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :directions, :reject_if => :all_blank, :allow_destroy => true

  validates :title, :description, :image, :ingredients, :directions, presence: true
  validates :title, :description, length: { in: 3..140 }
  has_attached_file :image, styles: { medium: "400x400#" }, default_url: "/images/:style/missing.png", preserve_files: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
