class RunsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
	@run = current_user.runs.build(run_params)
    if @run.save
      flash[:success] = "Note created!"
      redirect_to root_url
    else
	  @feed_items = []
      render 'home/index'
    end
  end

  def destroy
	@run.destroy
    flash[:success] = "Note deleted"
    redirect_to request.referrer || root_url
  end


  private

    def run_params
	  params.require(:run).permit(:note, :picture)
    end

    def correct_user
      @run = current_user.runs.find_by(id: params[:id])
      redirect_to root_url if @run.nil?
    end
end


