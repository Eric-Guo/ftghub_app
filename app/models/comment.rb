class Comment < ApplicationRecord
  belongs_to :fightpost, counter_cache: true
  belongs_to :user
  scope :recent, -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 140 }
end
