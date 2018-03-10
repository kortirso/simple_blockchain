# Represents user with doctor profession
class Doctor < ApplicationRecord
  belongs_to :user

  has_many :blocks

  validates :user_id, :profession, :hospital, presence: true
end
