class Folder < ActiveRecord::Base
  attr_accessible :name, :parent_id, :user_id
  belongs_to :user
  has_many :assets, dependent: :destroy
  has_many :shared_folders, :dependent => :destroy  
  acts_as_tree

  #a method to check if a folder has been shared or not  
  def shared?  
      !self.shared_assets.empty?  
  end  
end