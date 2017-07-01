require "rails_helper"

RSpec.describe ChallengeTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenge_types").to route_to("challenge_types#index")
    end

    it "routes to #new" do
      expect(:get => "/challenge_types/new").to route_to("challenge_types#new")
    end

    it "routes to #show" do
      expect(:get => "/challenge_types/1").to route_to("challenge_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenge_types/1/edit").to route_to("challenge_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/challenge_types").to route_to("challenge_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/challenge_types/1").to route_to("challenge_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenge_types/1").to route_to("challenge_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenge_types/1").to route_to("challenge_types#destroy", :id => "1")
    end

  end
end
