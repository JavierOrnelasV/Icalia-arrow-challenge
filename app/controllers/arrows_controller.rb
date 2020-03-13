class ArrowsController < ApplicationController
  def index
    @arrows = current_user.received_arrows
  end

  def new
    @arrow = current_user.created_arrows.new
    @users = User.all
  end

  def create
    destination = User.find(params[:arrow][:destination])
    reason = params[:arrow][:reason]
    current_user.created_arrows.create(destination: destination, reason: reason)
    redirect_to arrows_url
  end

  def show; end
end
