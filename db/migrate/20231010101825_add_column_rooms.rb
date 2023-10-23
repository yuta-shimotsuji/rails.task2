class AddColumnRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :owner, :string
  end
end
