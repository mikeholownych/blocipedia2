class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_and_belongs_to_many :collaborators, :class_name => 'User', :join_table => 'collaborators'

  def should_generate_new_friendly_id?
    name_changed?
  end
end
