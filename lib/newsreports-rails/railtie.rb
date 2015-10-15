require 'rails'

module NewsreportsRails
  class Railtie < ::Rails::Railtie
    initializer 'newsreports-rails' do
      ::ActiveSupport.on_load(:action_view) do
        ::Mime::Type.register('application/pdf', :pdf) unless ::Mime::Type.lookup_by_extension(:pdf)
        require 'newsreports-rails/template_handler'
      end
    end
  end
end

