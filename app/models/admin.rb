class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[superadmin manager support] }
  validates :status, inclusion: { in: %w[active suspended] }

  def active?
    status == "active"
  end

  def superadmin?
    role == "superadmin"
  end
   
  end
  