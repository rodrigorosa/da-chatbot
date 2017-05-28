require_relative './../../spec_helper.rb'

describe LinkModule::RemoveService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it "with valid id, remove Link" do
      link = create(:link, company: @company)
      @removeService = LinkModule::RemoveService.new({"id" => link.id})
      response = @removeService.call()
      expect(response).to match("Deletado com sucesso")
    end

    it "with invalid id, will receive an error message" do
      @removeService = LinkModule::RemoveService.new({"id" => rand(1..999)})
      response = @removeService.call()
      expect(response).to match("Link inválido")
    end
  end
end
