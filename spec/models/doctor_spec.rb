RSpec.describe Doctor, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :profession }
  it { should validate_presence_of :hospital }

  it 'should be valid' do
    doctor = create :doctor

    expect(doctor).to be_valid
  end
end
