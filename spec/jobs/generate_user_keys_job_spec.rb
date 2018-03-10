RSpec.describe GenerateUserKeysJob, type: :job do
  let!(:user) { create :user }

  it 'should execute GenerateUserKeysService' do
    expect_any_instance_of(GenerateUserKeysService).to receive(:generate)

    GenerateUserKeysJob.perform_now(user.id)
  end
end
