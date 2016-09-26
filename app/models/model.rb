class Model < ActiveRecord::Base
  belongs_to :make

  def self.sync_api(make)
    #search the models
    uri = URI("http://www.webmotors.com.br/carro/modelos")

    response = Net::HTTP.post_form(uri, { marca: make.webmotors_id })
    models_json = JSON.parse response.body

    # Itera no resultado e grava os modelos que ainda não estão persistidas
    models_json.each do |json|
      Model.where(name: json["Nome"], make_id: make.id).first_or_create
    end
  end
end