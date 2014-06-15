class DashboardController < ApplicationController

  def index
    @country = Country.first

    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
