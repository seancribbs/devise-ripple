## devise-ripple

An "ORM" strategy to use Devise with Riak (through the Ripple Ruby client)

So far, it is in a usable state *for me*, in the following environment:

 * gem 'rails', '3.0.0.beta4'
 * gem "ripple", :git => 'http://github.com/seancribbs/ripple.git', :ref => "4d9aa9"
 * gem 'devise', '1.1.rc2'

### Usage

 * Place ripple.rb in your project so as to get: `RAILS_ROOT/lib/devise/orm/ripple.rb`
 * In your `RAILS_ROOT/config/initializers/devise.rb` make sure to have `require 'devise/orm/ripple'`

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