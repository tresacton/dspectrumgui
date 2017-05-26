require 'rails_helper'

RSpec.describe "SectionTemplates", type: :request do
  describe "GET /section_templates" do
    it "works! (now write some real specs)" do
      get section_templates_path
      expect(response).to have_http_status(200)
    end
  end
end
