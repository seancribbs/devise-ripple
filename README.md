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

Hope that it helps!

### This is work in progress - please do fork and contribute!