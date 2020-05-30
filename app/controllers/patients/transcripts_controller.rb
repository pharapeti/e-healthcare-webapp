class Patients::TranscriptsController < PatientsController
  before_action :set_transcript, only: [:show, :generate_transcript]

  def index
    @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { patient: current_user.patient })
  end

  def set_transcript
    @transcript = Transcript.find(params[:id].presence || params[:transcript_id].presence)
  end

  def generate_transcript
    TranscriptMailer.with(transcript: @transcript, send_to: 'patient').chat_transcript.deliver_now
  end
end
