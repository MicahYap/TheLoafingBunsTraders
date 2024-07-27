# db/seeds.rb

admin_data = [
  { email: 'admin1@email.com', password: '123456', user_type: 'admin' },
  { email: 'admin2@email.com', password: '123456', user_type: 'admin' },
  { email: 'yapmicahsy@gmail.com', password: '123456', user_type: 'admin' } # New admin
]

admin_data.each do |admin|
  User.find_or_create_by!(email: admin[:email]) do |user|
    user.password = admin[:password]
    user.user_type = admin[:user_type]
  end
end

puts "Admins created successfully!"
