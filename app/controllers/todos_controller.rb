class TodosController < ApplicationController
  before_action :set_project

  def index
    render json: {
      meta: {
        count: @project.todos.count,
        page: 0
      },
      todos: @project.todos.order(:completed, :id)
    }
  end

  def create
    todo = Todo.new(todo_params)
    todo.project = @project

    if todo.save
      render json: { todo: todo }
    else
      render json: {
        message: "Could not create Todo",
        errors: todo.errors,
      }, status: :unprocessible_entity
    end
  end

  def update
    todo = @project.todos.find(params[:id])

    if todo.update(todo_params)
      render json: { todo: todo }
    else
      render json: {
        message: "Could not update Todo",
        errors: todo.errors,
      }, status: :unprocessible_entity
    end
  end

  def destroy
    todo = @project.todos.find(params[:id])

    if todo.destroy
      render json: { todo: nil }
    else
      render json: {
        message: "Could not destroy Todo, please try again",
      }, status: :unprocessible_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
