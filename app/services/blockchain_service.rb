# Service actions with blockchain
class BlockchainService
  def create_genesis_block
    Block.create(data: 'Genesis block') if Block.count.zero?
  end

  def last_block
    Block.last_block
  end

  # Use data only in string format (string or {}.to_json)
  def add_block(args = {})
    encrypted_data = CryptoService.new(user_id: args[:user_id]).encrypt(data: args[:data])
    Block.create(data: encrypted_data, previous_hash: last_block.current_hash, doctor_id: args[:doctor_id], user_id: args[:user_id])
  end
end
