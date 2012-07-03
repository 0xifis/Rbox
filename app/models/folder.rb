class Folder < ActiveRecord::Base
  attr_accessible :name, :parent_id, :user_id
  belongs_to :user
  has_many :assets, dependent: :destroy
  acts_as_tree
end