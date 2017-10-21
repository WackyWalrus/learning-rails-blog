class ChangeUserToUserIdInPosts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :posts, :user, :user_id
  end
end
