require "rails_helper"

RSpec.describe CapturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/captures").to route_to("captures#index")
    end

    it "routes to #new" do
      expect(:get => "/captures/new").to route_to("captures#new")
    end

    it "routes to #show" do
      expect(:get => "/captures/1").to route_to("captures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/captures/1/edit").to route_to("captures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/captures").to route_to("captures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/captures/1").to route_to("captures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/captures/1").to route_to("captures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/captures/1").to route_to("captures#destroy", :id => "1")
    end

  end
end
