User.create!(
  [
    { email: 'admin1@email.com', password: '123456', user_type: 'admin' },
    { email: 'admin2@email.com', password: '123456', user_type: 'admin' }
  ]
)

puts "Admins created successfully!"