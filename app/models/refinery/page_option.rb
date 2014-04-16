module Refinery
  class PageOption < Refinery::Core::BaseModel

    belongs_to :page

    attr_accessible :name, :value, :position

  end
end
