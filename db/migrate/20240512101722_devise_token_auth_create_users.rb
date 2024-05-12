class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change
    # 既存のテーブルに追加するカラム
    add_column :users, :provider, :string, null: false, default: "email" unless column_exists?(:users, :provider)
    add_column :users, :uid, :string, null: false, default: "" unless column_exists?(:users, :uid)
    add_column :users, :encrypted_password, :string, null: false, default: "" unless column_exists?(:users, :encrypted_password)
    add_column :users, :reset_password_token, :string unless column_exists?(:users, :reset_password_token)
    add_column :users, :reset_password_sent_at, :datetime unless column_exists?(:users, :reset_password_sent_at)
    add_column :users, :allow_password_change, :boolean, default: false unless column_exists?(:users, :allow_password_change)
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)
    add_column :users, :confirmation_token, :string unless column_exists?(:users, :confirmation_token)
    add_column :users, :confirmed_at, :datetime unless column_exists?(:users, :confirmed_at)
    add_column :users, :confirmation_sent_at, :datetime unless column_exists?(:users, :confirmation_sent_at)
    add_column :users, :unconfirmed_email, :string unless column_exists?(:users, :unconfirmed_email)
    add_column :users, :nickname, :string unless column_exists?(:users, :nickname)
    add_column :users, :image, :string unless column_exists?(:users, :image)

    # インデックスを追加（既存のインデックスを重複させないためにチェック）
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, [:uid, :provider], unique: true unless index_exists?(:users, [:uid, :provider])
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    add_index :users, :confirmation_token, unique: true unless index_exists?(:users, :confirmation_token)
  end
end
