class AddFamilyToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :family, :integer, array: true, default: []
  end
end
