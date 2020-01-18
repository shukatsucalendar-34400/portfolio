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