class Comment < ActiveRecord::Base
  validates :content, :author, :post, presence: true
  validates :content, length: { maximum: 1000}

  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :post
end
