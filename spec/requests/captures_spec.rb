require 'rails_helper'

RSpec.describe "Captures", type: :request do
  describe "GET /captures" do
    it "works! (now write some real specs)" do
      get captures_path
      expect(response).to have_http_status(200)
    end
  end
end
