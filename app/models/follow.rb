class Follow < ActiveRecord::Base
	belongs_to :followable, :polymorphic => true
	belongs_to :user

	scope :get_follow, lambda {|follow| where(:followable_id => follow.id, :followable_type => follow.class.to_s)}
end
