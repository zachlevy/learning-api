require "rails_helper"

RSpec.describe ChallengeResponsesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenge_responses").to route_to("challenge_responses#index")
    end

    it "routes to #new" do
      expect(:get => "/challenge_responses/new").to route_to("challenge_responses#new")
    end

    it "routes to #show" do
      expect(:get => "/challenge_responses/1").to route_to("challenge_responses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenge_responses/1/edit").to route_to("challenge_responses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/challenge_responses").to route_to("challenge_responses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/challenge_responses/1").to route_to("challenge_responses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenge_responses/1").to route_to("challenge_responses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenge_responses/1").to route_to("challenge_responses#destroy", :id => "1")
    end

  end
end
