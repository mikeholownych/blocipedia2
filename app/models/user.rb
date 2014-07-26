class User < ActiveRecord::Base
  has_many :wikis
  has_and_belongs_to_many :collaborators

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :premium, -> { where(premium: true) }
  scope :not, ->(id) { where('id != ?', id) }

  def collaborations
    wikis = []
    Collaborator.where(user: self).each do |collaboration|
      wikis << Wiki.find(collaboration.wiki_id)
    end
    wikis
  end
end
