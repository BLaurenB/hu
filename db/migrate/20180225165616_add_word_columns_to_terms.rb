class AddWordColumnsToTerms < ActiveRecord::Migration[5.1]
  def change
    rename_column :terms, :word, :word_1
    add_column :terms, :word_2, :string
    add_column :terms, :word_3, :string
    add_column :terms, :word_4, :string

  end
end
