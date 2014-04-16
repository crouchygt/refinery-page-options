require 'refinery/page_options/configuration'

module Refinery
  module PageOptions
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery

      engine_name :refinery_page_options

      def self.register(tab)
        tab.name = ::I18n.t(:'refinery.plugins.refinery_page_options.tab_name')
        tab.partial = "/refinery/admin/pages/tabs/options"
      end

      def self.initialize_tabs!
        PageOptions.config.enabled_tabs.each do |tab_class_name|
          unless (tab_class = tab_class_name.safe_constantize)
            Rails.logger.warn "PageOptions is unable to find tab class: #{tab_class_name}"
            next
          end
          tab_class.register { |tab| register tab }
        end
      end

      initializer "register refinery_page_options plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "page_options"
          plugin.hide_from_menu = true
        end
      end

      config.to_prepare do
        Refinery::PageOptions.attach!
      end

      config.after_initialize do
        initialize_tabs!
        Refinery.register_engine Refinery::PageOptions
      end
    end
  end
end
