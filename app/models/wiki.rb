class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user && ((user.role == "admin") || (user.role == "premium")) ? all : where(private: false) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
end


