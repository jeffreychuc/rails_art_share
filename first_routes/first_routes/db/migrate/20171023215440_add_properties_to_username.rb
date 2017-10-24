class AddPropertiesToUsername < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :username, default: '', null: false
  end
end
