class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :post_trends
  has_many :trends, through: :post_trends
  has_many :post_topics
  has_many :topics, through: :post_topics
  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 150 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end