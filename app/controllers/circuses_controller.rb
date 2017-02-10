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
    # create a new vote here
    new_vote(@circus)
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

    upload_file

    if @circus.save
      delete_old_file
      redirect_to @circus, notice: 'Circus was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /circuses/1
  def update

    upload_file
    if @circus.update(circus_params)
      delete_old_file
      redirect_to @circus, notice: 'Circus was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /circuses/1
  def destroy
    delete_old_file @circus.picture
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
      params.require(:circus).permit(:name, :picture, :flea_ids => [])
    end

    # decide who can edit a circus
    def can_edit
      unless current_user.is_admin? || @circus.belongs_to_user?(current_user)
        flash[:danger] = "You do not have permission to do that!"
        redirect_to circuses_path
      end
    end

    def upload_file
      # upload file if specified in params
      if params[:circus][:picture].present?
        if @circus.valid?
          # only save if the circus is valid to improve performance
          uploaded_file = params[:circus][:picture].path
          cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
          # save the reference to the old file and assign the new file to the instance
          @old_file = @circus.picture
          @circus.picture = cloudnary_file['public_id']
        end
        #remove image from the hash so we don't accidently use it
        params[:circus].delete :picture
      end
    end

    def delete_old_file old_file = nil
      # was a file id passed in, if not check in an instance variable
      file_to_del = old_file || @old_file
      # if we had a previous file then delete it
      Cloudinary::Uploader.destroy(file_to_del, :invalidate => true) unless file_to_del.blank?
    end
end
