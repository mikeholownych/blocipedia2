class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]
  before_action :set_wiki, only: [:new, :create, :index]

  # GET /collaborators
  # GET /collaborators.json
  def index
    @collaborators = @wiki.collaborators
  end

  # GET /collaborators/1
  # GET /collaborators/1.json
  def show
  end

  # GET /collaborators/new
  def new
    @users = User.premium.not(current_user.id)
    @collaborator = @wiki.collaborators.new
  end

  # GET /collaborators/1/edit
  def edit
  end

  # POST /collaborators
  # POST /collaborators.json
  def create
    @collaborator = @wiki.collaborators.build(collaborator_params)

    respond_to do |format|
      if @collaborator.save
        format.html { redirect_to @wiki, notice: 'Collaborator was successfully created.' }
        format.json { render :show, status: :created, location: @collaborator }
      else
        format.html { render :new }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collaborators/1
  # PATCH/PUT /collaborators/1.json
  def update
    respond_to do |format|
      if @collaborator.update(collaborator_params)
        format.html { redirect_to @collaborator, notice: 'Collaborator was successfully updated.' }
        format.json { render :show, status: :ok, location: @collaborator }
      else
        format.html { render :edit }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborators/1
  # DELETE /collaborators/1.json
  def destroy
    @collaborator.destroy
    respond_to do |format|
      format.html { redirect_to collaborators_url, notice: 'Collaborator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    def set_wiki
      @wiki = Wiki.friendly.find(params[:wiki_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collaborator_params
      params.require(:collaborator).permit(:user_id, :wiki_id)
    end
end
