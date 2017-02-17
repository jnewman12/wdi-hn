class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :upvotes
      t.integer :post_id, index: true

      t.timestamps null: false
    end
  end
end
