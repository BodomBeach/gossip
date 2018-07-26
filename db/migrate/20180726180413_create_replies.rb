class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.references :user, foreign_key: true
      t.references :repliable, polymorphic: true, index: true
      t.string :content
      t.timestamps
    end
  end
end
