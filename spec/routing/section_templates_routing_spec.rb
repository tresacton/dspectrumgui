require "rails_helper"

RSpec.describe SectionTemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/section_templates").to route_to("section_templates#index")
    end

    it "routes to #new" do
      expect(:get => "/section_templates/new").to route_to("section_templates#new")
    end

    it "routes to #show" do
      expect(:get => "/section_templates/1").to route_to("section_templates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/section_templates/1/edit").to route_to("section_templates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/section_templates").to route_to("section_templates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/section_templates/1").to route_to("section_templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/section_templates/1").to route_to("section_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/section_templates/1").to route_to("section_templates#destroy", :id => "1")
    end

  end
end
