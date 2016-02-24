require 'rails_helper'

RSpec.describe ProjectsController, type: :routing do
  describe "routes" do
    it "routes to #index" do
      expect(get '/projects').to route_to 'projects#index'
    end

    it "routes to #show" do
      expect(get '/projects/2').to route_to 'projects#show', id: "2"
    end

    it "routes to #create" do
      expect(post '/projects').to route_to 'projects#create'
    end

    it "routes to #update" do
      expect(patch '/projects/2').to route_to 'projects#update', id: "2"
    end

    it "routes to #destroy" do
      expect(delete '/projects/2').to route_to 'projects#destroy', id: "2"
    end

    it "does not route to #new" do
      expect(post '/projects/new').not_to be_routable
    end

    it "does not route to #new" do
      expect(patch '/projects/2/edit').not_to be_routable
    end
  end
end

