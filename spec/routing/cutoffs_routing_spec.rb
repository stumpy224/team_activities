require "spec_helper"

describe CutoffsController do
  describe "routing" do

    it "routes to #index" do
      get("/cutoffs").should route_to("cutoffs#index")
    end

    it "routes to #new" do
      get("/cutoffs/new").should route_to("cutoffs#new")
    end

    it "routes to #show" do
      get("/cutoffs/1").should route_to("cutoffs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cutoffs/1/edit").should route_to("cutoffs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cutoffs").should route_to("cutoffs#create")
    end

    it "routes to #update" do
      put("/cutoffs/1").should route_to("cutoffs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cutoffs/1").should route_to("cutoffs#destroy", :id => "1")
    end

  end
end
