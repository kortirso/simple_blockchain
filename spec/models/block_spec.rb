RSpec.describe Block, type: :model do
  it { should belong_to :user }
  it { should belong_to :doctor }

  it 'should be valid' do
    block = create :block

    expect(block).to be_valid
  end

  describe 'class methods' do
    context '.last_block' do
      let!(:block_1) { create :block, current_hash: '1' }
      let!(:block_2) { create :block, current_hash: '' }

      it 'returns last block with not empty current_hash' do
        expect(Block.last_block).to eq block_1
      end
    end
  end

  describe 'object methods' do
    context '.mine_block' do
      it 'should perform_later job MineBlockJob' do
        expect(MineBlockJob).to receive(:perform_later)

        create :block
      end
    end
  end
end
