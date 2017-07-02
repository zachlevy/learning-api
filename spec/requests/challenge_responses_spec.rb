require 'rails_helper'

RSpec.describe "ChallengeResponses", type: :request do
  describe "GET /challenge_responses" do
    it "works! (now write some real specs)" do
      get challenge_responses_path
      expect(response).to have_http_status(200)
    end
  end
end
