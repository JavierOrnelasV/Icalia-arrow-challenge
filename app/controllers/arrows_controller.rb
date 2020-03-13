class ArrowsController < ApplicationController
  def index
<<<<<<< HEAD
    @arrows = current_user.received_arrows
  end

  def new
    @arrow = current_user.created_arrows.new
=======
    @arrows = Arrow.where(destination: current_user)
  end

  def new
    @arrow = current_user.arrows.new
>>>>>>> 44524c6c7d2f878cb9667d1547a5fca000b40e68
    @users = User.all
  end

  def create
    destination = User.find(params[:arrow][:destination])
    reason = params[:arrow][:reason]
<<<<<<< HEAD
    current_user.created_arrows.create(destination: destination, reason: reason)
    redirect_to arrows_url
  end

  def show; end
=======
    current_user.arrows.create(destination: destination, reason: reason)
    redirect_to arrows_url
  end

  def show
  end
>>>>>>> 44524c6c7d2f878cb9667d1547a5fca000b40e68
end
