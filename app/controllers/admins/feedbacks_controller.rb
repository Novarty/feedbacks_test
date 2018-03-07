class Admins::FeedbacksController < ApplicationController
  before_action :authenticate_admin!
  expose :feedbacks, -> { init_feedbacks }

  def index; end

  private

  def init_feedbacks
    feedbacks = Feedback.order(created_at: :desc).all
    feedbacks = feedbacks.where("name ILIKE ? OR body ILIKE ?", "%#{params[:search]}%","%#{params[:search]}%") if params[:search]
    feedbacks # returns
  end
end
