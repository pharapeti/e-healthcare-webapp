class Doctors::TranscriptsController < DoctorsController
  def index
    @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { doctor: current_user.doctor })
  end
end
