require_relative './../../spec_helper.rb'

describe LinkModule::CreateService do
  before do
    @company = create(:company)

    @description = FFaker::Lorem.sentence
    @url = FFaker::Internet.http_url
  end

  describe '#call' do
    it "without url will receive an error" do
      @createService = LinkModule::CreateService.new({"description-origina"=> @description, "url-original" => nil })
      response = @createService.call()
      expect(response).to match("URL obrigatória")
    end

    it "with valid params will receive a success message" do
      @createService = LinkModule::CreateService.new({"description-original"=> @description, "url-original" => @url})
      response = @createService.call()
      expect(response).to match("Criado com sucesso")
    end

    it "with valid params will persist the new link" do
      @createService = LinkModule::CreateService.new({"description-original" => @description, "url-original" => @url})
      response = @createService.call()
      expect(Link.last.description).to match(@description)
      expect(Link.last.url).to match(@url)
    end

  end
end
