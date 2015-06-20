require File.expand_path('../boot', __FILE__)
#require 'wicked_pdf'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Facturacion
  class Application < Rails::Application
    config.time_zone = 'Bogota'
 #   config.middleware.use WickedPdf::Middleware
    #config.middleware.use "PDFKit::Middleware", :print_media_type => true  
    config.active_record.raise_in_transactional_callbacks = true
  end
end
