class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      
      t.string :title
      t.text   :content
      t.integer :post_length
      t.integer :post_words



      t.timestamps null: false
    end
  end
end
