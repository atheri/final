class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title
      t.string :kind
      t.string :data
      t.references :user, index: true
      
      t.timestamps null: false
    end
  end
end
