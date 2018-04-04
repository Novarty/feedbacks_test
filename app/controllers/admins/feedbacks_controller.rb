class Admins::FeedbacksController < ApplicationController
  before_action :authenticate_admin!
  expose :feedbacks, -> { init_feedbacks }

  def index; end

  private

  def init_feedbacks
    feedbacks = Feedback.order(created_at: :desc)
    feedbacks = feedbacks.where("name ILIKE ? OR body ILIKE ?",
      "%#{params[:search]}%",
      "%#{params[:search]}%") if params[:search]
    feedbacks.page(params[:page]) # returns
  end
end
