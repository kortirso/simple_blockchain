# Mining hash for block
class MineBlockJob < ApplicationJob
  queue_as :default

  def perform(block_id)
    MineBlockService.new(block_id: block_id).mine
  end
end
