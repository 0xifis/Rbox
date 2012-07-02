class Folder < ActiveRecord::Base
  attr_accessible :name, :parent_id, :user_id
  belongs_to :user
  acts_as_tree
end