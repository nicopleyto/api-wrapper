class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets
  validates :username, uniqueness: true #prevents record from being created twice
end
