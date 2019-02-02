class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :last_login_ip
      t.string :last_login_distance

      t.timestamps
    end
  end
end
