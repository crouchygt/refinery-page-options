require 'refinerycms-core'

module Refinery
  autoload :PageOptionsGenerator, 'generators/refinery/page_options_generator'

  module PageOptions

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end

      def attach!
        require 'refinery/page'
        require 'refinery/page_options/extension'

        config.enabled_models.each do |model_class_name|
          unless (model_class = model_class_name.safe_constantize)
            Rails.logger.warn "PageOptions is unable to find model class: #{model_class_name}"
            next
          end
          model_class.send :has_many_page_options
        end
      end
    end

    require 'refinery/page_options/engine'
  end
end
