module Devise
  module Orm
    module Ripple
      module Hook
        def devise_modules_hook!
          extend Schema
          include ::Ripple::Document::Timestamps
          include Compatibility
          yield
          return unless Devise.apply_schema
          devise_modules.each { |m| send(m) if respond_to?(m, true) }
        end
      end
      
      module Schema
        include Devise::Schema

        def apply_schema(name, type, options={})
          return unless Devise.apply_schema
          property name, :cast_as => type
        end        
      end
      
      module Compatibility
        extend ActiveSupport::Concern

        module ClassMethods
          
          def find(*args)
            puts "Entering find method with args => #{args}"
            super(args[1][:conditions][:email]) if args[1][:conditions].include? :email
          end
                  
        end
        
      end
    end
  end
end

Ripple::EmbeddedDocument::ClassMethods.class_eval do
  include Devise::Models
  include Devise::Orm::Ripple::Hook
end