# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def up
    change_table :users, bulk: true do |t|
      # ลบหรือคอมเมนต์บรรทัดนี้ หาก `email` มีอยู่แล้วในตาราง users
      # t.string :email, null: false, default: ""

      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      # เพิ่ม timestamps หากไม่มีใน schema ปัจจุบัน
      t.timestamps null: false if !column_exists?(:users, :created_at) && !column_exists?(:users, :updated_at)
    end

    # เพิ่ม indexes ที่เกี่ยวข้องกับ Devise
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    return if index_exists?(:users, :reset_password_token)

    add_index :users, :reset_password_token, unique: true
  end

  def down
    remove_index :users, :reset_password_token if index_exists?(:users, :reset_password_token)
    remove_index :users, :email if index_exists?(:users, :email)
    remove_column :users, :encrypted_password if column_exists?(:users, :encrypted_password)
    remove_column :users, :reset_password_token if column_exists?(:users, :reset_password_token)
    remove_column :users, :reset_password_sent_at if column_exists?(:users, :reset_password_sent_at)
    remove_column :users, :remember_created_at if column_exists?(:users, :remember_created_at)
    return unless column_exists?(:users, :created_at) && column_exists?(:users, :updated_at)

    remove_timestamps :users
  end
end
