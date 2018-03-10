# Crypto service
class CryptoService
  attr_reader :user

  def initialize(args = {})
    @user = User.find_by(id: args[:user_id])
  end

  def encrypt(args = {})
    public_key = OpenSSL::PKey::RSA.new(File.read(public_file_name))
    Base64.encode64(public_key.public_encrypt(args[:data]))
  end

  def decrypt(args = {})
    private_key = OpenSSL::PKey::RSA.new(File.read(private_file_name))
    private_key.private_decrypt(Base64.decode64(args[:data]))
  end

  private def private_file_name
    "#{Rails.root}/public#{user.private_key_file.to_s}"
  end

  private def public_file_name
    "#{Rails.root}/public#{user.public_key_file.to_s}"
  end
end