class AddRememberDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remmember_digest, :string
  end
end
