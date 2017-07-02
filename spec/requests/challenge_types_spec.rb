require 'rails_helper'

RSpec.describe "ChallengeTypes", type: :request do
  describe "GET /challenge_types" do
    it "works! (now write some real specs)" do
      get challenge_types_path
      expect(response).to have_http_status(200)
    end
  end
end
