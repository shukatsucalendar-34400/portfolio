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
user.businesses.create!(name:     '就活カレンダー',
                        web_site: 'http://localhost:3000/',
                        my_page:  'http://localhost:3000/users/1?current_page=business',
                        address:  'tokyo',
                        details:  'Calendar for job hunting',
                        memo:     'Made by rails')
50.times do
  business_name = Faker::Lorem.name
  user.businesses.create!(name: business_name)
end

business = user.businesses.first
today = Time.zone.now
business.schedules.create!(name:              'schedule_1',
                           user_id:           business.user_id,
                           first_date:        today.ago(10.days),
                           last_date:         today.ago(3.days),
                           deadline:          true,
                           deadline_date:     today.ago(20.days),
                           deadline_all_day:  false,
                           selection:         true,
                           selection_date:    today.ago(20.days),
                           selection_all_day: true,
                           status:            0)
business.schedules.create!(name:              'schedule_2',
                           user_id:           business.user_id,
                           first_date:        today.ago(10.days),
                           last_date:         today.ago(3.days),
                           deadline:          true,
                           deadline_date:     today.ago(20.days),
                           deadline_all_day:  false,
                           selection:         true,
                           selection_date:    today.ago(20.days),
                           selection_all_day: false,
                           status:            0)
10.times do |i|
  schedule_name = Faker::Lorem.name
  first_date = today.ago((3*i).days)
  last_date = first_date.since(7.days)
  
  status = i % 3
  business.schedules.create!(name:       schedule_name,
                             user_id:    1,
                             first_date: first_date,
                             last_date:  last_date,
                             status:     status)
end
