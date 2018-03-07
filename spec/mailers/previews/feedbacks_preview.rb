# Preview all emails at http://localhost:3000/rails/mailers/feedbacks
class FeedbacksPreview < ActionMailer::Preview
  def send_feedback
    FeedbacksMailer.send_feedback(Feedback.first)
  end
end
