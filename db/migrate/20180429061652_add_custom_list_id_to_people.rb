class AddCustomListIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :custom_list_id, :integer
  end
end
