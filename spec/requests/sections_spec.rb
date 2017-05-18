require 'rails_helper'

RSpec.describe "Sections", type: :request do
  describe "GET /sections" do
    it "works! (now write some real specs)" do
      get sections_path
      expect(response).to have_http_status(200)
    end
  end
end
