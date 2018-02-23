class CreateSnapshots < ActiveRecord::Migration[5.1]
  def change
    create_table :snapshots do |t|
      t.string :file
      t.references :venture, foreign_key: true

      t.timestamps
    end
  end
end
