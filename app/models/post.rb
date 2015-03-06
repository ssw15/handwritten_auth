class Post < ActiveRecord::Base
  belongs_to :user

  validates :facebook_id, :presence => true, :uniqueness => true
  validates :from_id, :presence => true
  validates :from_name, :presence => true
  validates :link, :presence => true
end
