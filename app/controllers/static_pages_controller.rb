class StaticPagesController < ApplicationController

  def home
    @splain = current_user.splains.build if logged_in?
    @splains = Splain.all.limit(3)
  end

  def help
  end

  def about
  end

  def contact
  end

end
