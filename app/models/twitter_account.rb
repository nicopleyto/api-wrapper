class TwitterAccount < ApplicationRecord
  belongs_to :user
  validates :username, uniqueness: true #prevents record from being created twice
end
