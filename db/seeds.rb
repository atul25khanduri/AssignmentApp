# frozen_string_literal: true

# Admin seed
User.create!(first_name: 'John',
             last_name: 'Doe',
             password: '12345678',
             email: 'admin@gmail.com',
             role: 'admin')
