class HomeController < ApplicationController
  def index
    Make.sync_api
    @makes = Make.all.order(:name)
  end
end
