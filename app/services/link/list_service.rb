module LinkModule
  class ListService
    def initialize(params, action)
      # TODO: identify origin and set company
      @company = Company.last
      @action = action
      @query = params["query"]
    end

    def call
      if @action == "search"
        links = Link.search(@query).where(company: @company)
      else
        links = @company.links
      end

      response = "*Lista de Links* \n\n"
      links.each do |l|
        response += "*#{l.id}* - "
        response += "*#{l.description}*\n"
        response += ">#{l.url}\n"
        response += "\n\n"
      end
      (links.count > 0)? response : "Nada encontrado"
    end
  end
end
