class SplainsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @splains = Splain.all.limit(30)
  end

  def create
    @splain = current_user.splains.build(splain_params)
    if @splain.save
      flash[:success] = "Splained!"
      redirect_to root_url
    else
      redirect_to request.referrer
    end
  end

  def edit
    @splain = Splain.find(params[:id])
  end

  def update
    @splain = Splain.find(params[:id])
    @user = @splain.user
    if @splain.update_attributes(splain_params)
      flash[:success] = "Resplained Succesfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @splain = Splain.find(params[:id])
    @user = @splain.user
    @splain.destroy
    flash[:success] = "Splain Unesplained"
    redirect_to @user
  end

  private

  def splain_params
    params.require(:splain).permit(:content)
  end

end
