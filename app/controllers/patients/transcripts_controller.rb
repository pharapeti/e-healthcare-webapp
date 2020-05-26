class Patients::TranscriptsController < PatientsController
  before_action :set_transcript, only: [:show]
  def index 
      @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { patient: current_user.patient })
  end
  
  def set_transcript
    @transcript = Transcript.find(params[:id])
  end
end
