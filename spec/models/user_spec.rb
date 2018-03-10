RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :role }
  it { should validate_inclusion_of(:role).in_array(%w[patient doctor admin]) }

  it 'should be valid' do
    user = create :user

    expect(user).to be_valid
  end

  it 'should be valid with email and password' do
    user = User.new email: 'example@gmail.com', password: 'password'

    expect(user).to be_valid
  end

  it 'should be invalid without email' do
    user = User.new(email: nil)
    user.valid?

    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'should be invalid without password' do
    user = User.new(password: nil)
    user.valid?

    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'should be invalid with a duplicate email' do
    User.create(email: 'example@gmail.com', password: 'password')
    user = User.new(email: 'example@gmail.com', password: 'password')
    user.valid?

    expect(user.errors[:email]).to include('has already been taken')
  end

  describe 'object methods' do
    context '.doctor?' do
      it 'returns true for doctors' do
        user = create :user, :doctor

        expect(user.doctor?).to eq true
      end

      it 'returns false for others' do
        user = create :user

        expect(user.doctor?).to eq false
      end
    end

    context '.admin?' do
      it 'returns true for admins' do
        user = create :user, :admin

        expect(user.admin?).to eq true
      end

      it 'returns false for others' do
        user = create :user

        expect(user.admin?).to eq false
      end
    end

    context '.generate_keys' do
      it 'should perform_later job GenerateUserKeysJob' do
        expect(GenerateUserKeysJob).to receive(:perform_later)

        create :user
      end
    end
  end
end
