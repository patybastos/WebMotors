class HomeController < ApplicationController
  def index
    @makes = Make.sync_api
  end
end
