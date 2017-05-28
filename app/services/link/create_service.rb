module LinkModule
  class CreateService
    def initialize(params)
      @company = Company.last
      @description = params["description-original"]
      @url = params["url-original"]
    end

    def call
      return "URL obrigatória" if @url.blank?
      link = Link.create(description: @description, url: @url)
      "Criado com sucesso"
    end
  end
end
