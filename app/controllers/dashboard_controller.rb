class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about]



  def about
  end



  def temp

  end


end
