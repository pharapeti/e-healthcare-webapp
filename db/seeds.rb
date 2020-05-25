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

answered_question = Question.create(created_by: patient, directed_to: doctor, description: 'How do I clean my ears?')
unanswered_question_1 = Question.create(created_by: patient, directed_to: doctor, description: 'Why is the sky blue?')
unanswered_question_2 = Question.create(created_by: patient, directed_to: doctor, description: 'Who goes there?')
answer = Answer.create(question: answered_question, answered_by: doctor, description: 'Use some earbuds mate')


# In progress interaction
urgent_request_in_progress =
  UrgentRequest.create(
    patient: patient, description: 'I need help Doctor, my blood pressure is very hight', status: :in_progress
  )

chat_room_in_progress = ChatRoom.create(urgent_request: urgent_request_in_progress, patient: patient, doctor: doctor)
message1_ip = ChatMessage.create(chat_room: chat_room_in_progress, user: patient_user, message: 'Hi there doctor')
message2_ip = ChatMessage.create(chat_room: chat_room_in_progress, user: doctor_user, message: 'Hello!')
message3_ip = ChatMessage.create(chat_room: chat_room_in_progress, user: patient_user, message: 'I need help')
message4_ip = ChatMessage.create(chat_room: chat_room_in_progress, user: doctor_user, message: "How's can I help you?")
message5_ip = ChatMessage.create(chat_room: chat_room_in_progress, user: patient_user, message: "Actually... don't worry about it")
message6_ip = ChatMessage.create(chat_room: chat_room_in_progress, user: doctor_user, message: 'Ok, see you!')
transcript_in_progress = Transcript.create(chat_room: chat_room_in_progress)

# Finished interaction
urgent_request_finished =
  UrgentRequest.create(
    patient: patient, description: 'I really need help, my heart rate is really high!', status: :finished
  )

chat_room_finished = ChatRoom.create(urgent_request: urgent_request_finished, patient: patient, doctor: doctor)
message1 = ChatMessage.create(chat_room: chat_room_finished, user: patient_user, message: 'Hi there doctor')
message2 = ChatMessage.create(chat_room: chat_room_finished, user: doctor_user, message: 'Hello!')
message3 = ChatMessage.create(chat_room: chat_room_finished, user: patient_user, message: 'I need help')
message4 = ChatMessage.create(chat_room: chat_room_finished, user: doctor_user, message: "How's can I help you?")
message5 = ChatMessage.create(chat_room: chat_room_finished, user: patient_user, message: "Actually... don't worry about it")
message6 = ChatMessage.create(chat_room: chat_room_finished, user: doctor_user, message: 'Ok, see you!')
transcript_finished = Transcript.create(chat_room: chat_room_finished)
