# Doctors
bob = Doctor.create!(name: "Bob", address: "Apt 101, Street #1, NYC", city: "NYC",
                     state: "NY", zip: "10013", school: "Stanford",
                     years_of_practice: "10")
susan = Doctor.create!(name: "Susan", address: "Apt 201, Street #2, NYC", city: "NYC",
                     state: "NY", zip: "10013", school: "Stanford",
                     years_of_practice: "15")
harry = Doctor.create!(name: "Harry", address: "Apt 301, Street #3, NYC", city: "NYC",
                     state: "NY", zip: "10013", school: "Stanford",
                     years_of_practice: "25")
# Customers and Pets
customer1 = Customer.create!(name: "Tom", email: "tom@example.org")
customer2 = Customer.create!(name: "John", email: "john@example.org")
pet1 = customer1.pets.create!(name: "Jil", pet_type: "cat", breed: "Munchkin", age: 5,
                       weight: 35, last_visit: Date.today)
pet2 = customer1.pets.create!(name: "Jane", pet_type: "cat", breed: "Persian", age: 4,
                       weight: 45, last_visit: Date.today)
pet3 = customer2.pets.create!(name: "Jack", pet_type: "dog", breed: "Labrador", age: 8,
                       weight: 65, last_visit: (Date.today - 7))
pet4 = customer2.pets.create!(name: "Saul", pet_type: "dog", breed: "Labrador", age: 9,
                       weight: 75, last_visit: (Date.today - 7))
# Appointments
pet1.appointments.create!(doctor: bob, visit_reason: "Monthly check up", visit_date: (Date.today + 7), requires_reminder: true)
pet2.appointments.create!(doctor: susan, visit_reason: "Monthly check up", visit_date: (Date.today + 8), requires_reminder: false)
pet3.appointments.create!(doctor: susan, visit_reason: "Infection", visit_date: (Date.today + 9), requires_reminder: false)
pet4.appointments.create!(doctor: harry, visit_reason: "Infection", visit_date: (Date.today + 2), requires_reminder: true)
