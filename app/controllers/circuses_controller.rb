class CircusesController < ApplicationController
  before_action :set_circus, only: [:show, :edit, :update, :destroy]

  # GET /circuses
  # GET /circuses.json
  def index
    @circuses = Circus.all
  end

  # GET /circuses/1
  # GET /circuses/1.json
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
  # POST /circuses.json
  def create
    @circus = Circus.new(circus_params)

    if @circus.save
      redirect_to @circus, notice: 'Circus was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /circuses/1
  # PATCH/PUT /circuses/1.json
  def update
    if @circus.update(circus_params)
      redirect_to @circus, notice: 'Circus was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /circuses/1
  # DELETE /circuses/1.json
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
end
