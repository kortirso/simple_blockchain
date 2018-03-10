# Service actions with blockchain
class BlockchainService
  def create_genesis_block
    Block.create(data: 'Genesis block') if Block.count.zero?
  end

  def last_block
    Block.last_block
  end

  def add_block(args = {})
    Block.create(data: args[:data], previous_hash: last_block.hash, doctor_id: args[:doctor_id], user_id: args[:user_id])
  end
end
