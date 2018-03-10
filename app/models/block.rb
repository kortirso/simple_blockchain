# Represents blocks of information in blockchain
class Block < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :doctor, optional: true

  after_commit :mine_block, on: :create

  def self.last_block
    all.where.not(current_hash: '').last
  end

  def mine_block
    MineBlockJob.perform_later(id)
  end
end
