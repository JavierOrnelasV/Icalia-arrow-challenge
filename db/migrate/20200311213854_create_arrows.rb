class CreateArrows < ActiveRecord::Migration[6.0]
  def change
    create_table :arrows do |t|
      t.integer :user_id
      t.integer :destination_id
      t.text :reason

      t.timestamps
    end
  end
end
