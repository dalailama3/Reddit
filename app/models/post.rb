class Post < ActiveRecord::Basehas_many :post_subs

  has_many :post_subs, foreign_key: :post_id
  has_many :subs, through: :post_subs, source: :sub

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    inverse_of: :posts
  )
end
