class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }
end
