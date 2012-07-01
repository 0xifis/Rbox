class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, . :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :username, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :firstname, :lastname, :username, :email, :password
  validates_uniqueness_of :username, :email
  validates_length_of :password, :minimum => 5, :message => "Sorry, your password is too short."
  validates_length_of :username, :in => 5..15, :message => "Sorry, your username has to be 5-20 characters long." 
end
