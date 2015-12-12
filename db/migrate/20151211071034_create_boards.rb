class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :desc
      t.references :user

      t.timestamps null: false
    end
  end
end
