class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :sale_details, :dependent => :destroy
  #callbacks
  before_save :add_total
  private
  def add_total
  	iva = self.subtotal * 0.16
  	self.total = self.subtotal + iva
  end
end