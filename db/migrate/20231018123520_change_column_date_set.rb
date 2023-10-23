class ChangeColumnDateSet < ActiveRecord::Migration[6.1]
  def change

    change_column :reservations , :start_day , :date
    change_column :reservations , :last_day , :date
    change_column :reservations , :number_of_people , :integer

  end
end
