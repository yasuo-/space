require "rails_helper"

RSpec.describe Host::UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/host/users").to route_to("host/users#index")
    end

    it "routes to #new" do
      expect(:get => "/host/users/new").to route_to("host/users#new")
    end

    it "routes to #show" do
      expect(:get => "/host/users/1").to route_to("host/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/host/users/1/edit").to route_to("host/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/host/users").to route_to("host/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/host/users/1").to route_to("host/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/host/users/1").to route_to("host/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/host/users/1").to route_to("host/users#destroy", :id => "1")
    end
  end
end
