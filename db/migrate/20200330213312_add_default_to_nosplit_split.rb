class AddDefaultToNosplitSplit < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :nosplit, :integer, default: 0
    change_column :restaurants, :split, :integer, default: 0

  end
end
