module LinkModule
  class RemoveService
    def initialize(params)
      @company = Company.last
      @params = params
      @id = params["id"]
    end

    def call
      link = @company.links.where(id: @id).last
      return "Link inválido" if link.nil?
      link.delete
      "Deletado com sucesso"
    end

  end
end
