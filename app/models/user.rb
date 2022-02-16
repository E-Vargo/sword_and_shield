class User < ActiveRecord::Base
    has_many :shields
    has_many :swords
end
