# Generate key pair for user service
class GenerateUserKeysService
  KEY_SIZE = 2048

  attr_reader :user, :private_key

  def initialize(args = {})
    @user = User.find_by(id: args[:user_id])
  end

  def generate
    generate_pair
    save_temp_files
    save_keys_for_user
    delete_temp_files
  end

  private def generate_pair
    @private_key = OpenSSL::PKey::RSA.generate(KEY_SIZE)
  end

  private def save_temp_files
    File.write(private_file_name, private_key.to_pem)
    File.write(public_file_name, private_key.public_key.to_pem)
  end

  private def save_keys_for_user
    user.private_key_file = File.open(private_file_name)
    user.public_key_file = File.open(public_file_name)
    user.save
  end

  private def delete_temp_files
    File.delete(private_file_name)
    File.delete(public_file_name)
  end

  private def private_file_name
    "#{Rails.root}/tmp/private_#{user.id}.pem"
  end

  private def public_file_name
    "#{Rails.root}/tmp/public_#{user.id}.pem"
  end
end
