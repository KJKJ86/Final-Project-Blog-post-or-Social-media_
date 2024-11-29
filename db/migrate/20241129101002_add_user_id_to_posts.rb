class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, foreign_key: true # ลบ null: false ออก
  end
end