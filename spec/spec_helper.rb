require 'rubygems'
require 'spork'

Spork.prefork do

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'

  if Spork.using_spork?
    require "rails/application"
    Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  end

  require File.expand_path("../../config/environment", __FILE__)

  require 'rspec/rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end
end

Spork.each_run do
  Rails.logger.level = 4

  # http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
  class ActiveRecord::Base
    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
      @@shared_connection || retrieve_connection
    end
  end
 end
