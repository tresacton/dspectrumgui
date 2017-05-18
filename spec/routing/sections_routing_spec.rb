require "rails_helper"

RSpec.describe SectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sections").to route_to("sections#index")
    end

    it "routes to #new" do
      expect(:get => "/sections/new").to route_to("sections#new")
    end

    it "routes to #show" do
      expect(:get => "/sections/1").to route_to("sections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sections/1/edit").to route_to("sections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sections").to route_to("sections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sections/1").to route_to("sections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sections/1").to route_to("sections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sections/1").to route_to("sections#destroy", :id => "1")
    end

  end
end
