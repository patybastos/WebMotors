class Make < ActiveRecord::Base
  has_many :models

  def self.sync_api
    #search the make
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.map do |make_params|
      Make.where(name: make_params["Nome"], webmotors_id: make_params["Id"]).first_or_create
    end
  end
end
