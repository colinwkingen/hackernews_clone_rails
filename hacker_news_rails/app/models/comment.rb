class Comment < ActiveRecord::Base
  belongs_to :post
  validates :content, :presence => true
  validates :user, :presence => true
end
