class User < ActiveRecord::Base
  has_many :markers
  has_secure_password
  validates :email, :username, uniqueness: true


  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|s| slug == s.slug}
  end
end

