class Draft < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: 5..100
  validates :description, presence: true, length: 5..500
  validates :user, presence: true
end