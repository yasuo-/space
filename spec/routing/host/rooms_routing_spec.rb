require "rails_helper"

RSpec.describe Host::RoomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/host/rooms").to route_to("host/rooms#index")
    end

    it "routes to #new" do
      expect(:get => "/host/rooms/new").to route_to("host/rooms#new")
    end

    it "routes to #show" do
      expect(:get => "/host/rooms/1").to route_to("host/rooms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/host/rooms/1/edit").to route_to("host/rooms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/host/rooms").to route_to("host/rooms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/host/rooms/1").to route_to("host/rooms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/host/rooms/1").to route_to("host/rooms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/host/rooms/1").to route_to("host/rooms#destroy", :id => "1")
    end
  end
end
