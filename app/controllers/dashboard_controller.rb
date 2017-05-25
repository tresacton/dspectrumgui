class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about]



  def about
  	@version = `git log -n 1 --pretty=format:"%H"`
    `git fetch`
  	@count_behind_origin = `git rev-list master..origin/master --count`.to_i
  end



  def temp

  end


end
