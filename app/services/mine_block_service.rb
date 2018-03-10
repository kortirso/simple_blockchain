require 'digest'

# Mining block hash service
class MineBlockService
  DIFFICULTY = 5

  attr_reader :block

  def initialize(args = {})
    @block = Block.find_by(id: args[:block_id])
  end

  def mine
    nonce = 0
    current_hash = calculate_hash(nonce)
    block.update(nonce: nonce, current_hash: current_hash)
  end

  private def calculate_hash(nonce)
    Digest::SHA256.hexdigest("#{block.id}#{block.previous_hash}#{block.created_at}#{block.data}#{nonce}")
  end
end
