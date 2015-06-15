class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :sale_details, :dependent => :destroy
end