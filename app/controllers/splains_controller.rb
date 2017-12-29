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
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def splain_params
    params.require(:splain).permit(:content)
  end

end
