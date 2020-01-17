# coding: utf-8

User.create!(
  [
    {
       name: "Sample User",
       email: "sample@email.com",
       employee_number: "1",
       uid: "1",
       password: "password",
       password_confirmation: "password",
       admin: true
    },
    {
       name: "上長1",
       email: "superior1@email.com",
       employee_number: "2",
       uid: "2",
       password: "password",
       password_confirmation: "password",
       superior: true
    },
    {
       name: "上長2",
       email: "superior2@email.com",
       employee_number: "3",
       uid: "3",
       password: "password",
       password_confirmation: "password",
       superior: true
    }
  ]
)

             

             

             
20.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  employee_number = n+4
  uid = n+4
  password = "password"
  User.create!(name: name,
               email: email,
               employee_number: employee_number,
               uid: uid,
               password: password,
               password_confirmation: password)
end
