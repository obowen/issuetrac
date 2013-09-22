class IssuesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @issues = Issue.all
    respond_to do |format|
      format.html
      format.json { render json: @issues }
    end
  end

  def new
    @issue = Issue.new
  end

  def create
    #render text: params[:issue].inspect
    ## RAILS_4 way: @issue = Issue.new(issue_params)
    @issue = Issue.new(params[:issue])
    @issue.reported_by = current_user.id
    if @issue.save
      redirect_to @issue
    else
      render 'new'
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def show
    @issue = Issue.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      #      format.json { render json: @issue, root: false } 
      #       (Use root:'false' to remove the obj wrapper class in the JSON format )
      format.json { render json: @issue }
    end

  end

  def update
    @issue = Issue.find(params[:id])
    
    if @issue.update_attributes(params[:issue])
      redirect_to @issue
    else
      render 'edit'
    end
  end


                     
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    
    redirect_to issues_path
  end

## RAILS_4 way
#  private
#    def issue_params
#      params.require(:issue).permit(:title, :text)
#    end
end
