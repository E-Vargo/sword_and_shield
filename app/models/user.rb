class User < ActiveRecord::Base
    has_secure_password
    has_many :shields
    has_many :swords

    def slug 
        self.username.gsub(" ", "-").downcase
    end
      
    def self.find_by_slug(slug)
      self.all.find {|s| s.slug == slug}
    end
end
