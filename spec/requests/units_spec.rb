require 'rails_helper'

RSpec.describe "Units", type: :request do
  describe "GET /units without authenticating" do
    it "redirects the user" do
      get units_path
      expect(response).to have_http_status(302)
    end
  end
end
