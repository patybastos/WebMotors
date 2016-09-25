class ModelsController < ApplicationController
  def index
    # Make request for Webmotors site
    make = Make.where(webmotors_id: params[:webmotors_make_id]).first

    Model.sync_api(make) if make.present?
    @models = make.models
  end
end
