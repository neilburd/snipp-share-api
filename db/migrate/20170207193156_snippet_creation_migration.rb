class SnippetCreationMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :code
      t.string :language
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
