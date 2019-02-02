class CreateLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.string :user_id
      t.string :ip_address
      t.string :latitude
      t.string :longitude
      t.string :status

      t.timestamps
    end
  end
end
