module Refinery
  class PageOptionsGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates", __FILE__)

    def rake_db
      rake("refinery_page_options:install:migrations")
    end

    def generate_page_options_initializer
      template "config/initializers/refinery/page_options.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "page_options.rb")
    end

  end
end
