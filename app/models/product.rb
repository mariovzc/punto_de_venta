class Product < ActiveRecord::Base
  has_many :sale_details, :dependent => :destroy
end