class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :init_breadcrumb

  private

  # the breadcurmb is an array of hashes, each hash contains 3 elements,
  # the 
  def init_breadcrumb
    @breadcrumb ||= []
    add_breadcrumb 'Home', root_path(format: :js)
  end

  # add a breadcrumb, by default the link it's ajax so add :remote to true if no remote is set
  def add_breadcrumb text, url = nil, html_options = {}
    html_options[:remote] = true unless html_options.has_key?(:remote)
    @breadcrumb << { text: text, url: url, html_options: html_options }
  end
  
end
