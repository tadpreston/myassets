class AddGroupIdToList < ActiveRecord::Migration[5.2]
  def change
    add_reference :lists, :group, foreign_key: true
  end
end
