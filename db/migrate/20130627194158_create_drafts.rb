class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.belongs_to :user, index: true
      t.boolean :archived

      t.timestamps
    end
  end
end
