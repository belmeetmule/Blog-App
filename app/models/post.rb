class Post < ApplicationRecord
  after_save :update_posts_counter
  after_destroy :update_posts_counter

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # validation
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 },
                                               numericality: { only_integer: true }

  def recent_five
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.all.length)
  end
end
