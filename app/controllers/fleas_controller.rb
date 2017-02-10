class FleasController < ApplicationController
  before_action :is_authenticated
  before_action :set_dog, only: [:index, :new, :create]
  before_action :set_flea, only: [:show, :edit, :update, :destroy]

  # GET /fleas
  def index
    @fleas = Flea.all
  end

  # GET /fleas/1
  def show
    new_vote(@flea)
  end

  # GET /fleas/new
  def new
    @flea = Flea.new
  end

  # GET /fleas/1/edit
  def edit
  end

  # POST /fleas
  def create
    @flea = Flea.new(flea_params)

    if @flea.save
      redirect_to @flea, notice: 'Flea was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fleas/1
  def update
    if @flea.update(flea_params)
      redirect_to @flea, notice: 'Flea was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fleas/1
  def destroy
    dog_id = @flea.dog
    @flea.destroy
    redirect_to dog_fleas_url(dog_id: dog_id), notice: 'Flea was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flea
      @flea = Flea.find(params[:id])
    end

    def set_dog
      @dog = Dog.find(params[:dog_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flea_params
      params.require(:flea).permit(:skill, :dog_id)
    end
end
