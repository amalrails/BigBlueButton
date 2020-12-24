module ChecksumGeneratorService
  def self.create_room_checksum(room)
    Digest::SHA1.hexdigest "createname=#{room.meeting_name}&meetingID=#{room.meeting_id}&attendeePW=111222&moderatorPW=333444&duration=100000#{ENV['API_KEY']}"
  end

  def self.join_room_checksum(meeting_id, email)
    Digest::SHA1.hexdigest "joinmeetingID=#{meeting_id}&password=111222&fullName=#{email}#{ENV['API_KEY']}"
  end
end
