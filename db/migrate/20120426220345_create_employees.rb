class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :mobile_number
      t.string :landline_number
      t.string :twitter_url
      t.string :facebook_url
      t.string :twitter_username

      t.timestamps
    end
  end
end
