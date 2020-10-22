class AddNullValueTofk < ActiveRecord::Migration[5.2]
  def change
    add_reference :quotes, :users, foreign_key: true, null: true
  end
end
