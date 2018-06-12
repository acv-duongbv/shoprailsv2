module Sluggable
  extend ActiveSupport::Concern
  included do
    acts_as_url :name, url_attribute: :slug, sync: true
  end

  def to_param
    "#{self.slug}"
  end
end
