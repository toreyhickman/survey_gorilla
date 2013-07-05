class User < ActiveRecord::Base
  include BCrypt

  validates :username, :presence => true, :uniqueness => true
  validates :password_hash, :presence => true

  has_many :sessions
  has_many :responses, :through => :sessions

  has_many :answered_surveys, :through => :sessions, :source => :survey, :foreign_key => "user_id"
  has_many :created_surveys, :class_name => "Survey", :foreign_key => "creator_id"

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(username, password_input)
    @user = User.find_by_username(username)
    if @user && @user.password == password_input
      @user
    else
      nil
    end
  end
end
