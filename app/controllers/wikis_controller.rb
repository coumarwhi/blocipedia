class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.user = current_user
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])


    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting your wiki."
      render :show
    end
  end

  def add_collaborators
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:id])
    if @wiki.users << @user
      flash[:notice] = "\"#{@user.email}\" is now a collaborator."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error adding a collaborator."
      render :edit
    end
  end

  def remove_collaborators
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:id])
    if @wiki.users.delete(@user)
      flash[:notice] = "\"#{@user.email}\" is no longer a collaborator."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error removing the collaborator."
      render :edit
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
