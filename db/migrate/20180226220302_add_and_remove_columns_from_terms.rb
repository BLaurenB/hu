class AddAndRemoveColumnsFromTerms < ActiveRecord::Migration[5.1]
  def change
    add_column :terms, :words, :text
    remove_column :terms, :word_1, :string
    remove_column :terms, :word_2, :string
    remove_column :terms, :word_3, :string
    remove_column :terms, :word_4, :string
  end
end
