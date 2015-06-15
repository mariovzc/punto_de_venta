class Client < ActiveRecord::Base
	has_many :sales, :dependent => :destroy
end