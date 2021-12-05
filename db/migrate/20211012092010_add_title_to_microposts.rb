class AddTitleToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :title, :text
  end
end
