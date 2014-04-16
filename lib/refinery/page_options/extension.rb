module Refinery
  module PageOptions
    module Extension
      def has_many_page_options
        has_many :page_options
        # has_many :image_options, :as => :page, :class_name => 'Refinery::PageOption', :order => 'position ASC'
        accepts_nested_attributes_for :page_options, :allow_destroy => true
#         # accepts_nested_attributes_for MUST come before def images_attributes=
#         # this is because images_attributes= overrides accepts_nested_attributes_for.
# 
#         # need to do it this way because of the way accepts_nested_attributes_for
#         # deletes an already defined images_attributes
        #module_eval do
          #def page_option_attributes=(data)
            # data = data.reject {|key, data| data.blank?}
            # ids_to_keep = data.map{|i, d| d['page_option_id']}.compact
           # puts 'Page option attributes'

            # image_pages_to_delete = if ids_to_keep.empty?
            #   self.image_pages
            # else
            #   self.page_options.where(
            #     Refinery::PageOption.arel_table[:id].not_in(ids_to_keep)
            #   )
            # end

            # image_pages_to_delete.destroy_all

          #   data.each do |i, image_data|
          #     image_page_id, image_id, caption =
          #       image_data.values_at('image_page_id', 'id', 'caption')
          # 
          #     next if image_id.blank?
          # 
          #     image_page = if image_page_id.present?
          #       self.image_pages.find(image_page_id)
          #     else
          #       self.image_pages.build(:image_id => image_id)
          #     end
          # 
          #     image_page.position = i
          #     image_page.caption = caption if Refinery::PageOption.captions
          #     image_page.save
          #   end
          #end
          #end
# 
        include Refinery::PageOptions::Extension::InstanceMethods
# 
        attr_accessible :page_options_attributes
      end

      module InstanceMethods

        # def caption_for_image_index(index)
        #   self.image_pages[index].try(:caption).presence || ""
        # end
        # 
        # def image_page_id_for_image_index(index)
        #   self.image_pages[index].try(:id)
        # end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::PageOptions::Extension)
