class Post < ActiveRecord::Base
  validates :author, :title, :content, presence: true
  validates :content, length: { maximum: 1000 }

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    inverse_of: :posts
  )

end
