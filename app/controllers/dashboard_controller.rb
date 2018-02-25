class DashboardController < ApplicationController

  def index
    @ventures = current_user.ventures.all
  end


end
