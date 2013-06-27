class DraftsController < ApplicationController
  before_action :set_draft, only: [:show, :edit, :update, :destroy]

  def index
    @drafts = Draft.all
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

    respond_to do |format|
      if @draft.save
        format.html { redirect_to drafts_path, notice: 'Draft was successfully created.' }
        format.json { render action: 'show', status: :created, location: @draft }
      else
        format.html { render action: 'new' }
        format.json { render json: @draft.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @draft.update(draft_params)
        format.html { redirect_to drafts_path, notice: 'Draft was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @draft.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @draft.destroy
    respond_to do |format|
      format.html { redirect_to drafts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_draft
      @draft = Draft.find(params[:id])
    end

    def draft_params
      params.require(:draft).permit(:title, :description, :tags, :user_id, :archived)
    end
end