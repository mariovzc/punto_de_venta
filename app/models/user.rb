class User < ActiveRecord::Base
  authenticates_with_sorcery!    
  
  #Validations
  validates :nombres, presence: true
  validates :email, format: {with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\z/}, presence: true, uniqueness: true
  
  # On update Validations
  validates :password, presence: true, confirmation: true, on: :update, if: :password
  validates :password, length: { minimum: 6 }, on: :update, if: :password

  # Callbacks
 # before_save :format_attributes
  after_initialize :set_default_password

  private
  def format_attributes
  	self.nombres = self.nombres.strip.titleize.squeeze(" ")
    self.user_search_hint = self.nombres + (self.email)
    self.user_search_hint.downcase!
  end

  def set_default_password
    self.password = '123456'
  end
end
