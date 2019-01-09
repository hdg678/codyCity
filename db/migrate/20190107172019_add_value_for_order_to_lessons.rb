class AddValueForOrderToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :value_for_order, :float
  end
end
