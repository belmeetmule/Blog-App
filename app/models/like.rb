class Like < ApplicationRecord
  after_save :update_likes_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  private

  def update_likes_counter
    post.update(likes_counter: post.likes.all.length)
  end
end
