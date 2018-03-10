# Represents user with doctor profession
class Doctor < ApplicationRecord
  belongs_to :user

  validates :user_id, :profession, :hospital, presence: true
end
