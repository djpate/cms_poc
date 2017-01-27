class Article < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  scope :published, ->{ where(published: true) }

  validates :title, :slug, :description, presence: true
  validates :slug, uniqueness: true

  has_paper_trail

  def publish!
    self.published = true
    self.published_date = Time.now
    self.save!
  end

  def unpublish!
    self.published = false
    self.published_date = nil
    self.save!
  end

  def should_generate_new_friendly_id?
    slug.blank?
  end

end
