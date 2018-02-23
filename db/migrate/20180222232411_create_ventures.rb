class CreateVentures < ActiveRecord::Migration[5.1]
  def change
    create_table :ventures do |t|
      t.string :title
      t.string :description
      t.string :notes
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
