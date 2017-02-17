class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :link,  presence: true
  has_many :comments
end
