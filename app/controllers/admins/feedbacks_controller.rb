class Admins::FeedbacksController < ApplicationController
  before_action :set_feedback, only: :show
  expose :feedbacks, -> { Feedback.all }

  def index
    # @feedbacks = Feedback.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      feedback = Feedback.find(params[:id])
    end
end
