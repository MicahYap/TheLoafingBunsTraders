require "rails_helper"

RSpec.describe TraderStocksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/trader_stocks").to route_to("trader_stocks#index")
    end

    it "routes to #new" do
      expect(get: "/trader_stocks/new").to route_to("trader_stocks#new")
    end

    it "routes to #show" do
      expect(get: "/trader_stocks/1").to route_to("trader_stocks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/trader_stocks/1/edit").to route_to("trader_stocks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/trader_stocks").to route_to("trader_stocks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/trader_stocks/1").to route_to("trader_stocks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/trader_stocks/1").to route_to("trader_stocks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/trader_stocks/1").to route_to("trader_stocks#destroy", id: "1")
    end
  end
end
