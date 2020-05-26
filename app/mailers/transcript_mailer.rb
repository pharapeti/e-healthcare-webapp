class TranscriptMailer < ApplicationMailer
  default from: 'transcripts@ehealth.com'

  def chat_transcript
    return unless params[:transcript].present?

    @transcript = params[:transcript]
    @doctor_name = @transcript.chat_room.request&.directed_to&.name
    @subject = @doctor_name.present? ? "Transcript for meeting with #{@doctor_name}" : 'Transcript for meeting'

    mail to: @transcript.chat_room.request.patient.user.email, subject: @subject
  end
end
