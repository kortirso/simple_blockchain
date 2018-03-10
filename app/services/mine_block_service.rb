# Mining block hash service
class MineBlockService
  DIFFICULTY = 4

  attr_reader :block, :previous_block

  def initialize(args = {})
    @block = Block.find_by(id: args[:block_id])
    @previous_block = block.previous_block
  end

  def mine(nonce = 0)
    previous_block_hash_exist?
    current_hash = CalculateHashService.calc_hash(block: block, previous_block: previous_block, nonce: nonce)
    proof_of_work = difficulty_substring
    while !current_hash.start_with?(proof_of_work) do
      nonce += 1
      current_hash = CalculateHashService.calc_hash(block: block, previous_block: previous_block, nonce: nonce)
    end
    block.update(nonce: nonce, current_hash: current_hash, previous_hash: previous_block.current_hash)
  end

  private def previous_block_hash_exist?
    loop do
      break unless previous_block.current_hash.empty?
      sleep(5)
    end
  end

  private def difficulty_substring
    '0' * DIFFICULTY
  end
end
