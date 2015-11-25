class SubsController < ApplicationController
  before_action :is_moderator?, only: [:edit, :update]


  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end

  end

  def show

    @sub = Sub.find(params[:id])
  

    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      render :show
    else
      render :edit
    end
  end


  private

  def is_moderator?
    sub = Sub.find(params[:id])
    if !current_user.id == sub.moderator_id
      flash[:error] = "You can only edit this sub if you are a moderator"
      redirect_to subs_url
    end

  end

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
