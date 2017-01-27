class Article < ApplicationRecord
  
  scope :published, ->{ where(published: true) }

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

end
