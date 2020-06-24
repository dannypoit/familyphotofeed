class RemoveFamilyFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :family, :integer
  end
end
