require "rails_helper"

RSpec.describe UnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/units").to route_to("units#index")
    end

    it "routes to #new" do
      expect(:get => "/units/new").to route_to("units#new")
    end

    it "routes to #show" do
      expect(:get => "/units/1").to route_to("units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/units/1/edit").to route_to("units#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/units").to route_to("units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/units/1").to route_to("units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/units/1").to route_to("units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/units/1").to route_to("units#destroy", :id => "1")
    end

  end
end
