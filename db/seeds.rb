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

stocks = [
  {name: 'Timothy Hay', ticker: 'TH', price: 850.00},
  {name: 'Oat Hay', ticker: 'OH', price: 900.00},
  {name: 'Mr. Hay Sticks', ticker: 'MHS', price: 520.00},
  {name: 'Veggie Mix', ticker: 'VM', price: 120.00},
  {name: 'Berry Loops', ticker: 'BL', price: 435.00},
  {name: 'Bamboo Sticks', ticker: 'BS', price: 120.00},
  {name: 'Forage Mix', ticker: 'FM', price: 370.00}
]

stocks.each do |stock|
  Stock.create!(stock)
end
