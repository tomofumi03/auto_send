User.create!(name:  "komu",
             email: "komu@komu.com",
             password:              "komukomu",
             password_confirmation: "komukomu",
             admin: true)

6.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
