module Refinery
  module PageOptions
    module Extension
      def has_many_page_options
        has_many :page_options
        accepts_nested_attributes_for :page_options, :allow_destroy => true
        attr_accessible :page_options_attributes
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::PageOptions::Extension)
