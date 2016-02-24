require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let!(:project) { Project.create! valid_attributes }

  let(:valid_attributes) do
    {
      title: "My Project",
      description: "I'm writing tests now!",
    }
  end

  let(:invalid_attributes) do
    {
      title: ""
    }
  end

  describe "#index" do
    it "returns a 200" do
      get :index
      expect(response).to be_success
    end
    it "returns json" do
      get :index
      expect(response.header['Content-Type']).to include('application/json')
    end

    it "has a count which is the same as database" do
      9.times do
        Project.create! valid_attributes
      end
      get :index
      json = JSON.parse(response.body)
      expect(json['projects'].length).to eq(10)
    end
  end

  describe "#create" do
    context "with valid params" do
      it "creates a new Task" do
          expect {
            post :create, project: valid_attributes
          }.to change(Project, :count).by(1)
      end
    end
  end

  describe "#update" do
    it "can process a update" do
      patch :update, id: project.to_param, project: { title: "Changes" }
      json = JSON.parse(response.body)
      expect(json['project']['title']).to eq "Changes"
    end
  end
end

