require "rails_helper"

RSpec.describe AdminRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin_requests").to route_to("admin_requests#index")
    end

    it "routes to #new" do
      expect(get: "/admin_requests/new").to route_to("admin_requests#new")
    end

    it "routes to #show" do
      expect(get: "/admin_requests/1").to route_to("admin_requests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin_requests/1/edit").to route_to("admin_requests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin_requests").to route_to("admin_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin_requests/1").to route_to("admin_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin_requests/1").to route_to("admin_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin_requests/1").to route_to("admin_requests#destroy", id: "1")
    end
  end
end
