require "spec_helper"

describe MedicsController do
  describe "routing" do

    it "routes to #index" do
      get("/medics").should route_to("medics#index")
    end

    it "routes to #new" do
      get("/medics/new").should route_to("medics#new")
    end

    it "routes to #show" do
      get("/medics/1").should route_to("medics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/medics/1/edit").should route_to("medics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/medics").should route_to("medics#create")
    end

    it "routes to #update" do
      put("/medics/1").should route_to("medics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/medics/1").should route_to("medics#destroy", :id => "1")
    end

  end
end
