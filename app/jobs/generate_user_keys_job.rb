# Generate User Keys Job
class GenerateUserKeysJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    GenerateUserKeysService.new(user_id: user_id).generate
  end
end
