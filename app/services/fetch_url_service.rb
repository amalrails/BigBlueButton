module FetchUrlService
  def self.create_url(room, create_room_checksum)
    "http://test-install.blindsidenetworks.com/bigbluebutton/api/create?name=#{room.meeting_name}&meetingID=#{room.meeting_id}&attendeePW=111222&moderatorPW=333444&duration=100000&checksum=#{create_room_checksum}"
  end

  def self.join_url(meeting_id, email, join_checksum)
    "http://test-install.blindsidenetworks.com/bigbluebutton/api/join?meetingID=#{meeting_id}&password=111222&fullName=#{email}&checksum=#{join_checksum}"
  end
end
