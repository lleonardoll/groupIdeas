class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @like = 0
    @nlike = 0
    if current_user
      @my_ideas = current_user.ideas
    else
      @my_ideas = []
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(ideas_params)
    @idea.idealizer = current_user.id

    if @idea.save
      redirect_to show_idea_path @idea
    else
      flash[:notice] = "There was an error, please try again later."
      render :new
    end
  end

  def show
    @settings
    @show_collaborators
    @collaborator

    @idea = Idea.find params[:id]
    @user = User.find_by_id(@idea.idealizer)
    @like = 0
    @nlike = 0
    @votations = @idea.votations
    @new_comment = Comment.new
    @comments = @idea.idea_comments
    @collaborators = @idea.idea_collaborators

    if current_user
      @my_ideas = current_user.ideas

    end

  end

  def edit
    @idea = Idea.find params[:id]
  end

  def update
    @idea = Idea.find params[:id]
    @idea.update_attributes(params.require(:idea).permit(:title, :idea, :link, :github))
    flash[:notice] = "Edited with Succes !"
    
    redirect_to show_idea_path(@idea.id)
  end

  def destroy
    @idea = Idea.find params[:id]
    @idea.delete
    flash[:notice] = "Excluded !"

    redirect_to ideas_path
  end

  private

  def ideas_params
    params.require(:idea).permit(:title, :idea, :idealizer, :like, :nlike, :link, :github)
  end

end