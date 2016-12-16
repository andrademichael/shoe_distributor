class AddShoeAndStoreTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands) do |t|
      t.string :name
      t.string :logo
    end
    create_table(:stores) do |t|
      t.string :name
      t.string :address
    end
  end
end
