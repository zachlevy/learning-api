require "rails_helper"

RSpec.describe CourseContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/course_contents").to route_to("course_contents#index")
    end

    it "routes to #new" do
      expect(:get => "/course_contents/new").to route_to("course_contents#new")
    end

    it "routes to #show" do
      expect(:get => "/course_contents/1").to route_to("course_contents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/course_contents/1/edit").to route_to("course_contents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/course_contents").to route_to("course_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/course_contents/1").to route_to("course_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/course_contents/1").to route_to("course_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/course_contents/1").to route_to("course_contents#destroy", :id => "1")
    end

  end
end
