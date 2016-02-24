require 'rails_helper'

RSpec.describe TodosController, type: :routing do
  describe "routes" do
    it "routes to #index" do
      expect(get '/projects/1/todos').to route_to 'todos#index', project_id: "1"
    end

    it "routes to #show" do
      expect(get '/projects/1/todos/2').to route_to 'todos#show', project_id: "1", id: "2"
    end

    it "routes to #create" do
      expect(post '/projects/1/todos').to route_to 'todos#create', project_id: "1"
    end

    it "routes to #update" do
      expect(patch '/projects/1/todos/2').to route_to 'todos#update', project_id: "1", id: "2"
    end

    it "routes to #destroy" do
      expect(delete '/projects/1/todos/2').to route_to 'todos#destroy', project_id: "1", id: "2"
    end

    it "does not route to #new" do
      expect(post '/projects/1/todos/new').not_to be_routable
    end

    it "does not route to #new" do
      expect(patch '/projects/1/todos/2/edit').not_to be_routable
    end
  end
end
