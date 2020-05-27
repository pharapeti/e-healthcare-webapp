class TranscriptMailer < ApplicationMailer
  default from: 'transcripts@ehealth.com'

  def chat_transcript
    return unless params[:transcript].present?

    @transcript = params[:transcript]
    @doctor_name = nil

    if @transcript.chat_room.request.respond_to?(:directed_to)
      @doctor_name = @transcript.chat_room.request&.directed_to&.name
    end

    @subject = @doctor_name.present? ? "Transcript for meeting with #{@doctor_name}" : 'Transcript for meeting'

    make_bootstrap_mail(
      to: @transcript.chat_room.request.patient.user.email,
      subject: @subject
    )
  end
end
