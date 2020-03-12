class ArrowsController < ApplicationController
  def index
    @arrows = Arrow.where(destination: current_user)
  end

  def new
    @arrow = current_user.arrows.new
    @users = User.all
  end

  def create
    destination = User.find(params[:arrow][:destination])
    reason = params[:arrow][:reason]
    current_user.arrows.create(destination: destination, reason: reason)
    redirect_to arrows_url
  end

  def show
  end
end
