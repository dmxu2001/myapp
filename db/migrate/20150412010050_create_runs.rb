class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.date :date
      t.text :note
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :runs, :users
	add_index :runs, [:user_id, :created_at]
  end
end
