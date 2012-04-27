class AddTwitterProfilePictureToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :twitter_profile_picture, :string
  end
end
