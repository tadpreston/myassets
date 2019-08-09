class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.references :user, foreign_key: true
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
