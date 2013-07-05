class Survey < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :creator, :class_name => "User"
  has_many :sessions
  has_many :users, :through => :sessions
  has_many :questions
end
