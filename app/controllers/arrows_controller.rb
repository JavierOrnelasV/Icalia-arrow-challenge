class ArrowsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create show]

  def index
    @arrows = current_user.received_arrows.order(id: :desc)
  end

  def new
    @arrow = current_user.created_arrows.new
    @users_name = User.where.not(id: current_user.id).pluck(:name)
  end

  def create
    destination = User.find_by(name: params[:arrow][:destination])
    reason = params[:arrow][:reason]
    @arrow = current_user.created_arrows.new(destination: destination, reason: reason)
    if @arrow.save
      flash[:success] = 'Done! Thanks for being so kind'
      redirect_to arrows_url
    else 
      flash[:danger] = 'Invalid arrow'
      redirect_to new_arrow_url
    end
  end

  def show
    @arrow = Arrow.find(params[:id])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, quote: true, footnotes: true)
    @arrow.reason = @markdown.render(@arrow.reason)
  end
end
