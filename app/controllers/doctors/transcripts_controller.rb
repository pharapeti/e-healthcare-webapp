class Doctors::TranscriptsController < DoctorsController
  before_action :set_transcript, only: [:show]
  def index
    @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { doctor: current_user.doctor })
  end

  def set_transcript
    @transcript = Transcript.find(params[:id])
  end
end
