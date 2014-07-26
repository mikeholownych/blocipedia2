class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many_and_belongs_to :collaborators
end
