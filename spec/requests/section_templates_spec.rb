require 'rails_helper'

RSpec.describe "SectionTemplates", type: :request do
  describe "GET /section_templates without authenticating" do
    it "redirects the user" do
      get section_templates_path
      expect(response).to have_http_status(302)
    end
  end
end
