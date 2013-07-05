class Question < ActiveRecord::Base
  validates :text, :presence => true

  belongs_to :survey
  has_many :options  
end
