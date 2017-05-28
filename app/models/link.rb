class Link < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates_presence_of :url, :description
  validate :tags_presence

  def add_tag(tag)
    tags << tag
  end

  private

  def tags_presence
    errors.add(:tags, "At least one tag must be added.") unless have_tags?
  end

  def have_tags?
    tags.size > 0
  end
end
