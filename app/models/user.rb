# Represents users
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :public_key_file, PemUploader
  mount_uploader :private_key_file, PemUploader

  after_commit :generate_keys, on: :create

  private def generate_keys
    GenerateUserKeysJob.perform_later(id)
  end
end
