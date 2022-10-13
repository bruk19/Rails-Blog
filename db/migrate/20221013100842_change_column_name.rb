class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :_role, :role
  end
end
