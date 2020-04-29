# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patient_user = User.create(email: 'patient@example.com', username: 'patient99', password: '123456', password_confirmation: '123456')
doctor_user = User.create(email: 'doctor@example.com', username: 'doctor01', password: '123456', password_confirmation: '123456')
patient = Patient.create(user: patient_user)

practice = Practice.create(name: 'MyHealth Co', phone: '98025833', address: '42 Wallaby Way, Sydney')
redeemed_license_activation = LicenseActivation.create(license_number: 'KLJ45', code: 'xyz123', redeemed: true, redeemed_at: 1.week.ago, practice: practice)
valid_license_action = LicenseActivation.create(license_number: 'JBL999', code: 'abc123', practice: practice)
doctor = Doctor.create(user: doctor_user, license_activation: redeemed_license_activation, practice: practice)

question = Question.create(created_by: patient, directed_to: doctor, description: 'How do I clean my ears?')
answer = Answer.create(question: question, answered_by: doctor, description: 'Use some earbuds mate')
