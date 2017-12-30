class CallsController < ApplicationController
  before_action :logged_in_user

  def create
    @splain = Splain.find(params[:splain_id])

    if @splain.supporters.include?(current_user)
      @splain.supporters.delete(current_user)
    end

    if @splain.detractors.include?(current_user)
      @splain.detractors.delete(current_user)
    end
    # byebug
    if params[:judgement] == "true"
      Call.create(judgement: true, user_id: current_user.id, splain_id: @splain.id)
    else
      Call.create(judgement: false, user_id: current_user.id, splain_id: @splain.id)
    end
    redirect_to request.referrer
  end

end
