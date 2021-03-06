user1 = User.create(name: 'Парацельс', email: 'para@celsus.com', password: '12345678')
user2 = User.create(name: 'Гиппократ', email: 'hipp@hosp.com', password: '12345678')
user3 = User.create(name: 'Склифосовский', email: 'sklif@hosp.com', password: '12345678')
User.create(name: 'Пациент_1', email: 'patient_1@hosp.com', password: '12345678')
User.create(name: 'Пациент_2', email: 'patient_2@hosp.com', password: '12345678')
User.create(name: 'Пациент_3', email: 'patient_3@hosp.com', password: '12345678')
User.create(name: 'Пациент_4', email: 'patient_4@hosp.com', password: '12345678')
User.create(name: 'Пациент_5', email: 'patient_5@hosp.com', password: '12345678')
User.create(name: 'Пациент_6', email: 'patient_6@hosp.com', password: '12345678')
User.create(name: 'Пациент_7', email: 'patient_7@hosp.com', password: '12345678')

Doctor.create(user: user1, profession: 'Крутой врач', hospital: 'Базельский университет')
Doctor.create(user: user2, profession: 'Отец медицины', hospital: 'Лачуга в Греции')
Doctor.create(user: user3, profession: 'Хирург', hospital: 'Московский университет')

chain = BlockchainService.new
chain.create_genesis_block
chain.add_block(data: 'First real block of data', doctor_id: Doctor.first.id, user_id: User.last.id)
