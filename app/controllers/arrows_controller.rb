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
    @arrow = current_user.created_arrows.new(destination: destination, reason: reason)
    if @arrow.save
      flash[:success] = 'Arrow sent'
      redirect_to arrows_url
    else 
      flash[:danger] = 'Invalid arrow'
      redirect_to new_arrow_url
    end
  end

  def show; end
end
