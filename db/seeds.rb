User.create!(name:  "tako",
             email: "t@k.o",
             password:              "takotako",
             password_confirmation: "takotako",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "example",
             email: "example@example.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
             

user = User.first
user.businesses.create!(name: '就活カレンダー',
                        abbreviated_name: '就カレ',
                        web_site: 'http://localhost:3000/',
                        my_page: 'http://localhost:3000/users/1?current_page=business',
                        address: 'tokyo',
                        details: 'Calendar for job hunting',
                        memo: 'Made by rails')
50.times do
  business_name = Faker::Lorem.sentence(5)
  user.businesses.create!(name: business_name)
end