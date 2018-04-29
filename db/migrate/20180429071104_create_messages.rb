class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :link
      t.datetime :posted_at
      t.text :content

      t.timestamps null: false
    end
  end
end
