class SubsController < ApplicationController
  before_action :is_moderator?, only: [:edit, :update]
  def new

  end

  def create

  end

  def show

  end

  def index
    @subs = Sub.all
    render :index

  end

  def edit

  end

  def update

  end
end
