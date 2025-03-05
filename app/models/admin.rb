class Admin < ApplicationRecord
    before_create :generate_api_key
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
  
  private
  
  def generate_api_key
    self.api_key = SecureRandom.hex(20) # Generates a 40-character hex key
  end

   
  end
  