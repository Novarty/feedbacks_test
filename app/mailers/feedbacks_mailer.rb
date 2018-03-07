class FeedbacksMailer < ApplicationMailer
  default from: 'localhost@ex.com',
          template_path: 'feedbacks_mailer'
  
  def send_feedback(feedback)
    @feedback = feedback
    mail to: 'admin@example.com',
         subject: 'Recieved new feedback'
  end
end
