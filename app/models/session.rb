class Session < ActiveRecord::Base
  validates_uniqueness_of :survey_id, :scope => :user_id

  belongs_to :user
  belongs_to :survey
  has_many :responses
end
