class Draft < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: 5..100
  validates :description, presence: true, length: 5..500
  validates :tags, length: { maximum: 80 }
  validates :user, presence: true

  def mark_as_archived
    self.archived = true
  end

  def unmark_as_archived
    self.archived = false
  end
end
