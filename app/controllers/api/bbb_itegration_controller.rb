require 'net/http'
require 'uri'
require 'digest/sha1'

class Api::BbbItegrationController < ApplicationController
  def join
    room = Room.find_by(meeting_id: params[:room_id])
    create_room_checksum = ::ChecksumGeneratorService.create_room_checksum(room)
    create_uri = URI(::FetchUrlService.create_url(room, create_room_checksum))
    response = Net::HTTP.get_response(create_uri)
    raise BbbError unless response.code.eql?('200')

    join_checksum = ::ChecksumGeneratorService.join_room_checksum(room.meeting_id,
                                                                  current_user.email)
    join_url = ::FetchUrlService.join_url(room.meeting_id, current_user.email, join_checksum)
    redirect_to join_url
  rescue ::StandardError
    error(room)
  end

  def error(room)
    redirect_to room, alert: 'Could not join the room try again later!!'
  end
end
