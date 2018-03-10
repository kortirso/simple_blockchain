# Represents users
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :public_key_file, PemUploader
  mount_uploader :private_key_file, PemUploader

  has_one :doctor_job, class_name: 'Doctor'
  has_many :blocks

  validates :role, presence: true, inclusion: { in: %w[patient doctor admin] }
  validates :name, presence: true

  after_commit :generate_keys, on: :create

  def private_key_filename
    private_key_file.to_s
  end

  def public_key_filename
    public_key_file.to_s
  end

  def doctor?
    role == 'doctor'
  end

  def admin?
    role == 'admin'
  end

  private def generate_keys
    GenerateUserKeysJob.perform_later(id)
  end
end
