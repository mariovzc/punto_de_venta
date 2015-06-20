class SaleDetail < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
  #callBacks
  after_save :calcular_total
  before_save :add_sub_total
  before_destroy :eliminar_total
  private
  def add_sub_total
  	self.total =  (self.product.precio.nil? ? 0 : self.product.precio) * (self.cantidad.nil? ? 0 : self.cantidad)
  end
  def calcular_total
  	temp = self.sale.sale_details.sum(total)
  	self.sale.subtotal = temp
  	self.sale.save
  end
  def eliminar_total
  	temp = self.sale.subtotal - self.total
  	self.sale.subtotal = temp
  	self.sale.save
  end
end
