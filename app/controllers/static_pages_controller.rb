class StaticPagesController < ApplicationController

  def home
    @user = current_user
    @splain = current_user.splains.build if logged_in?
    @splains = Splain.all.limit(10)
  end

  def help
  end

  def about
  end

  def contact
  end

end
