class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :notifications, dependent: :destroy
  validates :content, presence: true
end
