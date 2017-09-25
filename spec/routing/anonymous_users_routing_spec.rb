require "rails_helper"

RSpec.describe AnonymousUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/anonymous_users").to route_to("anonymous_users#index")
    end

    it "routes to #new" do
      expect(:get => "/anonymous_users/new").to route_to("anonymous_users#new")
    end

    it "routes to #show" do
      expect(:get => "/anonymous_users/1").to route_to("anonymous_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/anonymous_users/1/edit").to route_to("anonymous_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/anonymous_users").to route_to("anonymous_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/anonymous_users/1").to route_to("anonymous_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/anonymous_users/1").to route_to("anonymous_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/anonymous_users/1").to route_to("anonymous_users#destroy", :id => "1")
    end

  end
end
