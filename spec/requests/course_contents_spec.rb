require 'rails_helper'

RSpec.describe "CourseContents", type: :request do
  describe "GET /course_contents" do
    it "works! (now write some real specs)" do
      get course_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
