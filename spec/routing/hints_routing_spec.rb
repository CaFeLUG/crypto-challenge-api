require "rails_helper"

RSpec.describe HintsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hints").to route_to("hints#index")
    end

    it "routes to #new" do
      expect(:get => "/hints/new").to route_to("hints#new")
    end

    it "routes to #show" do
      expect(:get => "/hints/1").to route_to("hints#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hints/1/edit").to route_to("hints#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hints").to route_to("hints#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hints/1").to route_to("hints#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hints/1").to route_to("hints#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hints/1").to route_to("hints#destroy", :id => "1")
    end

  end
end
