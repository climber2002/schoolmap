class SettingsController < ApplicationController

  def toggle_random_school
    Setting.random_school = !Setting.random_school

    respond_to do |format|
      format.js
    end
  end

end
