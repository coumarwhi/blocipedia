class User < ApplicationRecord

  has_many :wikis
  has_many :collaborators

  before_save { self.role ||= :standard}

  after_update :public_wiki


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]

  def public_wiki
    if self.standard?
      self.wikis.update_all(private: false)
    end
  end
end

