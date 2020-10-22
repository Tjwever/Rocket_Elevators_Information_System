class RectifyQuote < ActiveRecord::Migration[5.2]
  def change
    remove_reference :quotes, :users, foreign_key: true, null: true
  end
end
