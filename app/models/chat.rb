class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many_attached :images
end
