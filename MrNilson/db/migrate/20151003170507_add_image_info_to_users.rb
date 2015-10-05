class AddImageInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_info, :text
  end
end
