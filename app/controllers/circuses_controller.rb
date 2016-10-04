class CircusesController < ApplicationController
  before_action :is_authenticated
  before_action :set_circus, only: [:show, :edit, :update, :destroy]
  before_action :can_edit, only: [:edit, :update, :destroy]

  # GET /circuses
  def index
    @circuses = Circus.all
    # @circuses = current_user.circuses
  end

  # GET /circuses/1
  def show
  end

  # GET /circuses/new
  def new
    @circus = Circus.new
  end

  # GET /circuses/1/edit
  def edit
  end

  # POST /circuses
  def create
    # new circus is assigned to current_user
    @circus = current_user.circuses.new(circus_params)
    if @circus.save
      redirect_to @circus, notice: 'Circus was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /circuses/1
  def update
    if @circus.update(circus_params)
      redirect_to @circus, notice: 'Circus was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /circuses/1
  def destroy
    @circus.destroy
    redirect_to circuses_url, notice: 'Circus was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circus
      @circus = Circus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circus_params
      params.require(:circus).permit(:name, :flea_ids => [])
    end

    # decide who can edit a circus
    def can_edit
      unless current_user.is_admin? || @circus.belongs_to_user?(current_user)
        flash[:danger] = "You do not have permission to do that!"
        redirect_to circuses_path
      end
    end
end
