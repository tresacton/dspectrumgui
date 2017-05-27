require 'rails_helper'

RSpec.describe "Devices", type: :request do
  describe "GET /devices without authenticating" do
    it "redirects the user" do
      get devices_path
      expect(response).to have_http_status(302)
    end
  end
end
