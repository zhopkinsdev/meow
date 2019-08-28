class Cat < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy



  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { maximum: 500 }
end
