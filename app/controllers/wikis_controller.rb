class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def public
    @wikis = Wiki.where('private = ?', false)
  end

  # GET /wikis
  # GET /wikis.json
  def index
    @wikis = current_user.wikis
    @collaborations = current_user.collaborators
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
  end

  # GET /wikis/new
  def new
    @wiki = current_user.wikis.new
  end

  # GET /wikis/1/edit
  def edit
    @users = User.where('id != ?', current_user.id)
    @collaborators = @wiki.collaborators
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @wiki = current_user.wikis.new(wiki_params)

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render :show, status: :created, location: @wiki }
      else
        format.html { render :new }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to wikis_url, notice: 'Wiki was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.friendly.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:name, :body, :user_id, :private, :collaborator_ids => [])
    end
end
