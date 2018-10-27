class CreateLamps < ActiveRecord::Migration[5.2]
  def change
    create_table :lamps do |t|
      t.string :name
      t.string :ip_address

      t.timestamps
    end
  end
end
