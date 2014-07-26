class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  def should_generate_new_friendly_id?
    name_changed?
  end
end
