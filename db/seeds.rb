# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

users_csv = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
parsed_users_csv = CSV.parse(users_csv, :headers => true, :encoding => 'ISO-8859-1')
parsed_users_csv.each do |row|
  user = User.new
  user.username = row['username']
  user.password = row['password']
  user.last_login_ip = row['last_login_ip']
  user.last_login_distance = row['last_login_distance']
  user.save
end

logins_csv = File.read(Rails.root.join('lib', 'seeds', 'logins.csv'))
parsed_logins_csv = CSV.parse(logins_csv, :headers => true, :encoding => 'ISO-8859-1')
parsed_logins_csv.each do |row|
  login = Login.new
  login.ip_address = row['ip_address']
  login.latitude = row['latitude']
  login.longitude = row['longitude']
  login.user_id = row['user_id']
  login.status = row['status']
  login.save
end
