class Comment < ApplicationRecord
  after_save :update_comments_counter
  after_destroy :update_comments_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def update_comments_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
