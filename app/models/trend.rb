class Trend < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  has_many :post_trends
  has_many :posts, through: :post_trends
end