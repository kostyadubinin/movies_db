class ChangeRevenueColumn < ActiveRecord::Migration
  def up
    change_column :movies, :revenue, :integer, limit: 5
  end

  def down
    change_column :movies, :revenue, :integer
  end
end
