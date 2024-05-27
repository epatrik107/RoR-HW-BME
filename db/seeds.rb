OrderItem.delete_all
Order.delete_all
Product.delete_all

User.delete_all




eloetelek = Category.find_by(name: 'Előételek')
leves = Category.find_by(name: 'Leves')
koret = Category.find_by(name: 'Köret')
pizza = Category.find_by(name: 'Pizza')
desszert = Category.find_by(name: 'Desszert')
uditok = Category.find_by(name: 'Üdítő')


products = Product.create([
  { name: 'Bruschetta', descpription: 'Ropogós kenyér paradicsommal és bazsalikommal', price: 1500, category: eloetelek },
  { name: 'Gulyásleves', descpription: 'Hagyományos magyar leves marhahússal', price: 2500, category: leves },
  { name: 'Sült burgonya', descpription: 'Ropogósra sült burgonya', price: 800, category: koret },
  { name: 'Margherita Pizza', descpription: 'Paradicsomos pizza mozzarellával és bazsalikommal', price: 3000, category: pizza },
  { name: 'Tiramisu', descpription: 'Kávés ízesítésű olasz desszert', price: 2000, category: desszert },
  { name: 'Coca-Cola', descpription: 'Frissítő szénsavas üdítőital', price: 500, category: uditok }
])


users = User.create([
  { email: 'admin@example.com', password: 'password', admin: true, first_name: 'Admin', last_name: 'User', phone_number: '123456789', city: 'Budapest', street_address: 'Fő utca 1', postal_code: '1234' },
  { email: 'user@example.com', password: 'password', admin: false, first_name: 'Regular', last_name: 'User', phone_number: '987654321', city: 'Budapest', street_address: 'Fő utca 2', postal_code: '1234' }
])


orders = Order.create([
  { user: users[1], order_date: DateTime.now, status: 'pending' }
])


order_items = OrderItem.create([
  { order: orders[0], product: products[0], quantity: 2, subtotal: 3000 },
  { order: orders[0], product: products[5], quantity: 1, subtotal: 500 }
])

