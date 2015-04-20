class Topic < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  has_many :post_topics
  has_many :posts, through: :post_topics
end