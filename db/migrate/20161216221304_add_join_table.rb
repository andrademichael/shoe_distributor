class AddJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:brands_stores) do |t|
      t.integer :brand_id
      t.integer :store_id
    end
  end
end
