# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patient_user = User.create(email: 'patient@example.com', username: 'patient99', password: '123456', password_confirmation: '123456')
doctor_user1 = User.create(email: 'doctor1@example.com', username: 'doctor01', password: '123456', password_confirmation: '123456')
doctor_user2 = User.create(email: 'doctor2@example.com', username: 'doctor02', password: '123456', password_confirmation: '123456')
doctor_user3 = User.create(email: 'doctor3@example.com', username: 'doctor03', password: '123456', password_confirmation: '123456')
patient = Patient.create(user: patient_user)

practice1 = Practice.create(name: 'MyHealth Co', phone: '98025833', address: '42 Wallaby Way, Sydney')
practice2 = Practice.create(name: 'Campbelltown Medical Center', phone: '98015633', address: '31 Paramatta Road, Sydney')
practice3 = Practice.create(name: 'Campbelltown Personal Health', phone: '98504855', address: '19 Griffith Street, Sydney')
Practice.create(name: 'Campbelltown Hospital', phone: '98335201', address: '99 Marley Way, Sydney')
Practice.create(name: 'Price Alfred Hospital', phone: '99804832', address: '12 Jason Parade, Sydney')


LicenseActivation.create(license_number: 'BBL130', code: 'abc123', practice: practice2)

redeemed_license_activation = LicenseActivation.create(license_number: 'KLJ45', code: 'xyz123', redeemed: true, redeemed_at: 1.week.ago, practice: practice1)
valid_license_action = LicenseActivation.create(license_number: 'JBL999', code: 'abc123', practice: practice1)
doctor = Doctor.create(user: doctor_user1, license_activation: redeemed_license_activation, practice: practice1)

redeemed_license_activation_2 = LicenseActivation.create(license_number: 'KLJ43', code: 'xfs111', redeemed: true, redeemed_at: 1.week.ago, practice: practice2)
doctor_2 = Doctor.create(user: doctor_user2, license_activation: redeemed_license_activation_2, practice: practice2)

redeemed_license_activation_3 = LicenseActivation.create(license_number: 'KLP99', code: 'adw114', redeemed: true, redeemed_at: 1.week.ago, practice: practice3)
doctor_3 = Doctor.create(user: doctor_user3, license_activation: redeemed_license_activation_3, practice: practice3)

answered_question = Question.create(created_by: patient, directed_to: doctor, description: 'How do I clean my ears?')
unanswered_question_1 = Question.create(created_by: patient, directed_to: doctor, description: 'Why is the sky blue?')
unanswered_question_2 = Question.create(created_by: patient, directed_to: doctor, description: 'Who goes there?')
answer = Answer.create(question: answered_question, answered_by: doctor, description: 'Use some earbuds mate')


# CONSULTATION REQUESTS

# scheduled
ConsultationRequest.create(
  patient: patient, directed_to: doctor, description: 'Just wanted to have my weekly checkup with you',
  scheduled_for: 1.week.from_now, status: :scheduled
)

# # in progress
# consultation_request_ip =
#   ConsultationRequest.create(
#     patient: patient, directed_to: doctor, description: 'Just wanted to have my daily checkup with you',
#     scheduled_for: 1.week.from_now, status: :in_progress
#   )
#
# chat_room_ip = ChatRoom.create(consultation_request: consultation_request_ip, patient: patient, doctor: doctor)
# ChatMessage.create(chat_room: chat_room_ip, user: patient_user, message: 'Hi there doctor')
# ChatMessage.create(chat_room: chat_room_ip, user: doctor_user1, message: 'Hello!')
# ChatMessage.create(chat_room: chat_room_ip, user: patient_user, message: 'I need help')
# ChatMessage.create(chat_room: chat_room_ip, user: doctor_user1, message: "How's can I help you?")
# ChatMessage.create(chat_room: chat_room_ip, user: patient_user, message: "Actually... don't worry about it")
# ChatMessage.create(chat_room: chat_room_ip, user: doctor_user1, message: 'Ok, see you!')
# Transcript.create(chat_room: chat_room_ip)

# completed
cr_finished =
  ConsultationRequest.create(
    patient: patient, directed_to: doctor, description: 'Just wanted to have my daily checkup with you',
    scheduled_for: 1.week.from_now, status: :finished
  )

chat_r_finished = ChatRoom.create(consultation_request: cr_finished, patient: patient, doctor: doctor)
ChatMessage.create(chat_room: chat_r_finished, user: patient_user, message: 'Hi there doctor')
ChatMessage.create(chat_room: chat_r_finished, user: doctor_user1, message: 'Hello!')
ChatMessage.create(chat_room: chat_r_finished, user: patient_user, message: 'I need help')
ChatMessage.create(chat_room: chat_r_finished, user: doctor_user1, message: "How's can I help you?")
ChatMessage.create(chat_room: chat_r_finished, user: patient_user, message: "Actually... don't worry about it")
ChatMessage.create(chat_room: chat_r_finished, user: doctor_user1, message: 'Ok, see you!')
Transcript.create(chat_room: chat_r_finished)


# URGENT REQUESTS
# Finished interaction
urgent_request_finished =
  UrgentRequest.create(
    patient: patient, description: 'I really need help, my heart rate is really high!', status: :finished
  )

chat_room_finished = ChatRoom.create(urgent_request: urgent_request_finished, patient: patient, doctor: doctor)
ChatMessage.create(chat_room: chat_room_finished, user: patient_user, message: 'Hi there doctor')
ChatMessage.create(chat_room: chat_room_finished, user: doctor_user1, message: 'Hello!')
ChatMessage.create(chat_room: chat_room_finished, user: patient_user, message: 'I need help')
ChatMessage.create(chat_room: chat_room_finished, user: doctor_user1, message: "How's can I help you?")
ChatMessage.create(chat_room: chat_room_finished, user: patient_user, message: "Actually... don't worry about it")
ChatMessage.create(chat_room: chat_room_finished, user: doctor_user1, message: 'Ok, see you!')
Transcript.create(chat_room: chat_room_finished)

# # Attachments
# consultation_request_ip.media.attach(
#   io: File.open('app/assets/images/test_images/neck_pain.jpg'),
#   filename: 'neck_pain.jpg',
#   content_type: 'image/jpg'
# )

cr_finished.media.attach(
  io: File.open('app/assets/images/test_images/leg_pain.jpg'),
  filename: 'leg_pain.jpg',
  content_type: 'image/jpg'
)

urgent_request_finished.media.attach(
  io: File.open('app/assets/images/test_images/arm_pain.jpg'),
  filename: 'arm_pain.jpg',
  content_type: 'image/jpg'
)
