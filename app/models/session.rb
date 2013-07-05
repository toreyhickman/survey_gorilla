class Session < ActiveRecord::Base
  validates_uniqueness_of :survey, :scope => :user

  belongs_to :user
  belongs_to :survey
  has_many :responses
end
