class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about]



  def about
    `git fetch`
  	@tags = `git describe --tags`
  	@version = `git log -n 1 --pretty=format:"%H"`
  	@count_behind_origin = `git rev-list master..origin/master --count`.to_i
  end



  def temp

  end

  def contribute
  	@cont = `cat #{Rails.root.join('mcs', 'contribution.md').to_s}` 
  end


end
