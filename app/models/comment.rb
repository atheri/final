class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :data, presence: true

end
