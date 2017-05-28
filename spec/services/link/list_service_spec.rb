require_relative './../../spec_helper.rb'

describe LinkModule::ListService do
  before do
    @company = create(:company)
  end

  describe "#call" do
    it "with list command and zero links return don't find message" do
      @listService = LinkModule::ListService.new({}, 'list')

      response = @listService.call()
      expect(response).to match("Nada encontrado")
    end

    it "with list command and two links, find links in response" do
      @listService = LinkModule::ListService.new({}, 'list')

      link1 = create(:link, company: @company)
      link2 = create(:link, company: @company)

      response = @listService.call()

      expect(response).to match(link1.description)
      expect(response).to match(link1.url)

      expect(response).to match(link2.description)
      expect(response).to match(link2.url)
    end

    it "with search command and emtpy query, return don't find message" do
      @listService = LinkModule::ListService.new({"query" => ''}, 'search')

      response = @listService.call()
      expect(response).to match("Nada encontrado")
    end

    it "with search command and valid query, return links in response" do
      link = create(:link, company: @company)

      @listService = LinkModule::ListService.new({"query" => link.description.split(" ").sample}, 'search')
      response = @listService.call()

      expect(response).to match(link.description)
      expect(response).to match(link.url)
    end
  end
end
