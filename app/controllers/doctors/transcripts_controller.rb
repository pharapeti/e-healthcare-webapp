class Doctors::TranscriptsController < DoctorsController
  before_action :set_transcript, only: [:show, :generate_transcript]
  def index
    @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { doctor: current_user.doctor })
  end

  def set_transcript
    @transcript = Transcript.find(params[:id].presence || params[:transcript_id].presence)
  end

  def generate_transcript
    TranscriptMailer.with(transcript: @transcript).chat_transcript.deliver_now
  end
end
