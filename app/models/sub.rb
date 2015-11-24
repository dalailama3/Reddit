class Sub < ActiveRecord::Base
  has_many :posts
  belongs_to :moderator, foreign_key: :moderator_id
end
