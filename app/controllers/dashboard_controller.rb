class DashboardController < ApplicationController

  def index
    @country = Country.first
  end
  
end
