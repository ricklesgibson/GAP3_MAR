require 'bcrypt'
class User < ActiveRecord::Base
  has_many :events

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_secure_password
    
   has_attached_file :avatar, :styles => { 
    :medium => "300x300>", 
    :thumb => "100x100>",
    :icon => "50x50>" },
    :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
