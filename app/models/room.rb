class Room < ApplicationRecord
  before_create :create_unique_meeting_id

  def create_unique_meeting_id
    loop do
      self.meeting_id = SecureRandom.hex(5)
      break unless self.class.exists?(meeting_id: meeting_id)
    end
  end
end
