## devise-ripple

An "ORM" strategy to use Devise with Riak (through the Ripple Ruby client)

So far, it is in a usable state *for me*, in the following environment:

 * gem 'rails', '3.0.0.beta3'
 * gem 'ripple', '0.7.0'
 * gem 'devise', :git => 'http://github.com/plataformatec/devise.git', :ref => '9291ab'

### Usage

 * Place ripple.rb in your project so as to get: `RAILS_ROOT/lib/devise/orm/ripple.rb`
 * In your `RAILS_ROOT/config/initializers/devise.rb` make sure to have `require 'devise/orm/ripple'`
 
Note that it likely won't work with cutting-edge versions of Rails or Devise.

**Don't forget to expose appropiate 'key' and 'id' properties in your model!**

### Example User model

    class User
      include Ripple::Document

      devise :registerable, :confirmable :database_authenticatable, :recoverable, :validatable

      property :name, String
      property :email, String, :presence => true
      property :password, String
      property :password_confirmation, String
  
      timestamps!
      
      def key
        email
      end
  
      def id
        email
      end  
    
    end

### That said, this is work in progress - please do fork and contribute!