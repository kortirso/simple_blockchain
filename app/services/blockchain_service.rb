# Service actions with blockchain
class BlockchainService
  def create_genesis_block
    Block.create(data: 'Genesis block') if Block.count.zero?
  end

  # Use data only in string format (string or {}.to_json)
  def add_block(args = {})
    encrypted_data = CryptoService.new(user_id: args[:user_id]).encrypt(data: args[:data])
    Block.create(data: encrypted_data, doctor_id: args[:doctor_id], user_id: args[:user_id])
  end

  # Check for valid all blockchain
  def valid?
    blocks = Block.all.order(id: :asc).to_a
    blocks[1..-1].each.with_index(1) do |block, index|
      return false unless neighbor_blocks_valid?(blocks[index], blocks[index - 1])
    end
    true
  end

  # Check for valid separate block
  def block_valid?(args = {})
    block = Block.find_by(id: args[:block_id])
    previous_block = block.previous_block
    neighbor_blocks_valid?(block, previous_block)
  end

  private def neighbor_blocks_valid?(block, previous_block)
    return false if previous_block.current_hash != block.previous_hash
    return false if block.current_hash != CalculateHashService.calc_hash(block: block, previous_block: previous_block)
    true
  end
end
