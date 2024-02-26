class ChangeDataCheckOutToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :check_out, :date
  end
end
