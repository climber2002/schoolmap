module Api
  module V1
    class SchoolsController < ApplicationController

      skip_before_filter :verify_authenticity_token

      include SchoolsSupport

    end
  end
end