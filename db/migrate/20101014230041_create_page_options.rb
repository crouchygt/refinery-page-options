class CreatePageOptions < ActiveRecord::Migration
  def change
    create_table Refinery::PageOption.table_name do |t|
      t.integer :page_id
      t.string :name
      t.string :value
      t.integer :position
    end
  end
end