class Post < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :description, length: { minimum: 250 }
  #has_many :comments, :dependent => :destroy
  #has_many :users, through: :comments
end
