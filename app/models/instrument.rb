class Instrument < ApplicationRecord
  # before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items
  has_many :musics
  has_one_attached :image
  acts_as_paranoid  

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }
  paginates_per 1
  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS  Ibanez Charvel Washburn }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  scope :filter_by_user_id, -> (user_id) { where user_id: user_id}

end