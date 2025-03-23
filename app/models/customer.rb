class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]




  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |customer|
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0, 20]
      customer.name = auth.info.name if customer.respond_to?(:name) # Adjust based on your model fields
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  
    has_many :orders
    has_many :payments
    has_many :notifications
    has_one :cart, dependent: :destroy
    has_many :invoices
    
  
    # validates :name, presence: true
    # validates :phone, presence: true, uniqueness: true
  end
  