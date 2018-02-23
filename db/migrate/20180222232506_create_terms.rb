class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.references :venture, foreign_key: true
      t.references :snapshot, foreign_key: true

      t.timestamps
    end
  end
end
