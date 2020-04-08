class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :users, through: :comments
  # Validaciones del modelo
  validates :title, :description, :user_id, presence: true
  validates :description, length: { minimum: 250 }
  validates :user_id, numericality: true
  validates :user_id, numericality: { only_integer: true }
end
