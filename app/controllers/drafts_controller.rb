class DraftsController < ApplicationController
  respond_to :html
  before_action :set_draft, only: [:show, :edit, :update, :destroy]

  def index
    @drafts = Draft.where(:archived => false)
  end

  def show
  end

  def new
    @draft = Draft.new
  end

  def edit
  end

  def create
    @draft = Draft.new(draft_params)
    @draft.user = current_user
    
    if @draft.save
      respond_with @draft
    else
      render action: "new"
    end
  end

  def update
    if @draft.update(draft_params)
      redirect_to drafts_path, notice: 'Draft was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @draft.archived 
      @draft.unmark_as_archived
    else
      @draft.mark_as_archived
    end
    
    @draft.save
    redirect_to drafts_url 
  end

  private
    def set_draft
      @draft = Draft.find(params[:id])
    end

    def draft_params
      params.require(:draft).permit(:title, :description, :tags, :user_id, :archived)
    end
end