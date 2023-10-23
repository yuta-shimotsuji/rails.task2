class RenameFromOwnerColumnToUseridColumnOnRoom < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :owner, :user_id
  end
end
