class SpacesController < ApplicationController
  before_action :require_login
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    @spaces = policy_scope(Space)
  end

  def show
  end

  def new
    @space = Space.new
  end

  def edit
  end

  def create
    @space = Space.new(space_params.merge(user_id: current_user.id))
    if @space.save
      redirect_to @space, notice: 'Space was successfully created.'
    else
      render :new
    end
  end

  def update
    if @space.update(space_params)
      redirect_to @space, notice: 'Space was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to spaces_url, notice: 'Space was successfully destroyed.'
  end

  private
    def set_space
      @space = Space.find(params[:id])
    end

    def space_params
      params.require(:space).permit(:name, :description)
    end
end
