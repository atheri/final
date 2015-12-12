class Post < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true

end
