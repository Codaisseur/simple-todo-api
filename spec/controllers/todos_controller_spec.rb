require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let!(:project) { Project.create! title: "My Project" }
  let!(:todo) { Todo.create! valid_attributes }
  let(:valid_attributes) do
    {
      title: "I'm writing tests now!",
      completed: false,
      project_id: project.id
    }
  end
  let(:invalid_attributes) do
    {
      title: ""
    }
  end
  describe "#index" do
    it "returns a 200" do
      get :index, project_id: project.to_param
      expect(response).to be_success
    end
    it "returns json" do
      get :index, project_id: project.to_param
      expect(response.header['Content-Type']).to include('application/json')
    end
    it "has a count which is the same as database" do
      9.times do
        Todo.create! valid_attributes
      end
      get :index, project_id: project.to_param
      json = JSON.parse(response.body)
      expect(json['todos'].length).to eq(10)
    end
  end
  describe "#create" do
    context "with valid params" do
      it "creates a new Task" do
          expect {
            post :create, project_id: project.to_param, todo: valid_attributes
          }.to change(Todo, :count).by(1)
      end
    end
  end
  describe "#update" do

    it "can process a update" do
      patch :update, id: todo.to_param, project_id: project.to_param, todo: { title: "Changes" }
      json = JSON.parse(response.body)
      expect(json['todo']['title']).to eq "Changes"
    end
  end
end
