require 'rails_helper'

RSpec.describe "Competences", type: :request do
  describe "GET /competences" do
    it "return success" do
      get competences_path
      expect(response).to have_http_status(200)
    end

    it 'show page' do
      visit competences_path
      expect(page).to have_content 'Список компетенций'
    end
  end
end
