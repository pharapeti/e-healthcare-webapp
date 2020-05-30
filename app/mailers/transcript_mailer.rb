class TranscriptMailer < ApplicationMailer
  default from: 'transcripts@ehealth.com'

  def chat_transcript
    return unless params[:transcript].present? && params[:send_to].present?

    @transcript = params[:transcript]

    send_to =
      if params[:send_to] == 'doctor'
        @transcript.chat_room.doctor.user.email
      else
        @transcript.chat_room.patient.user.email
      end

    make_bootstrap_mail to: send_to, subject: "Transcript for #{send_to}"
  end
end
