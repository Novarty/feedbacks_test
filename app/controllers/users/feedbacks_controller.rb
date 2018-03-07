class Users::FeedbacksController < ApplicationController
  expose :feedback

  # GET /feedbacks/new
  def new; end

  # POST /feedbacks
  def create
    if feedback.save
      redirect_to root_path, notice: 'Feedback was successfully send!'
      FeedbacksMailer.send_feedback(feedback).deliver
    else
      render :new
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit(:name, :email, :body)
    end
end
