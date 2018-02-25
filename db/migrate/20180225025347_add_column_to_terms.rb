class AddColumnToTerms < ActiveRecord::Migration[5.1]
  def change
    add_column :terms, :word, :string
  end
end
