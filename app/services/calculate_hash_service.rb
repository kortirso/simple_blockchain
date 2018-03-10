# Calculate hash based on 2 blocks
class CalculateHashService
  def self.calc_hash(args = {})
    nonce = args[:nonce].nil? ? args[:block].nonce : args[:nonce]
    Digest::SHA256.hexdigest("#{args[:block].id}#{args[:previous_block].current_hash}#{args[:block].created_at}#{args[:block].data}#{nonce}")
  end
end
