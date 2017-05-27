require 'rails_helper'

RSpec.describe "Sections", type: :request do
  describe "GET /sections without authenticating" do
    it "redirects the user" do
      get sections_path
      expect(response).to have_http_status(302)
    end
  end
end
