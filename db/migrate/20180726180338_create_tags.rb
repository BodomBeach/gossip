class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.timestamps
    end
  end
end
