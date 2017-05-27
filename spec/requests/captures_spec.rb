require 'rails_helper'

RSpec.describe "Captures", type: :request do
  describe "GET /captures without authenticating" do
    it "redirects the user" do
      get captures_path
      expect(response).to have_http_status(302)
    end
  end
end
