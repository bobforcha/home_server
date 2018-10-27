class AddStatusToLamps < ActiveRecord::Migration[5.2]
  def change
    add_column :lamps, :status, :string
  end
end
