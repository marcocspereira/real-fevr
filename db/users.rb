return if User.any?

puts('Start of users seed task')

users = [
  { admin: true, name: 'Admin User', password: 'admin123', email: 'marcocsp@.com' },
  { admin: false, name: 'Basic User', password: 'basic123', email: 'marcocsp@gmail.com' }
]
User.create!(users)

puts('End of users seed task')
