class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
  