class Patients::TranscriptsController < PatientsController
  def index 
      @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { patient: current_user.patient })
  end
end
