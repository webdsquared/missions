class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :status
      t.date :published_on
      t.integer :blog_id

      t.timestamps
    end
  end
end
