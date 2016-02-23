class Fightpost < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likers, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 260 }
  validate :picture_size

  acts_as_taggable

  private

  def picture_size
    errors.add(:picture, 'should be less than 3MB') unless picture.size < 3.megabytes
  end
end
