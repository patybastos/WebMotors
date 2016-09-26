class ModelsController < ApplicationController
  def index
    # Make request for Webmotors site
    make = Make.includes(:models).find(params[:make_id])

    Model.sync_api(make) if make.present?
    @models = make.models.order(:name)
  end
end
