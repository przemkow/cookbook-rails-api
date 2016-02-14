class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|

      t.string :name
      t.text :description
      t.integer :preparation_time_in_sec
      t.belongs_to :user, index:true

      t.timestamps null: false
    end
  end
end
