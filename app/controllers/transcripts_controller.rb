class TranscriptsController < ApplicationController
  def index
    if current_user.doctor.present?
      @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { doctor: current_user.doctor})
    elsif current_user.patient.present?
      @transcripts = Transcript.joins(:chat_room).where(chat_rooms: { patient: current_user.patient })
    end
  end
end
