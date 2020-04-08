class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, :post_id, :comentario, presence: true
  validates :user_id, :post_id, numericality: true
  validates :user_id, :post_id, numericality: { only_integer: true }
end
