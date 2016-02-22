class TodosController < ApplicationController
  def index
    render json: {
      meta: {
        count: Todo.count,
        page: 0
      },
      todos: Todo.all
    }
  end

  def create
    if todo = Todo.create(todo_params)
      render json: { todo: todo }
    else
      render json: {
        message: "Could not create Todo",
        errors: todo.errors,
      }, status: :unprocessible_entity
    end
  end

  def update
    todo = todo.find(params[:id])

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
    todo = todo.find(params[:id])

    if todo.destroy
      render json: { todo: nil }
    else
      render json: {
        message: "Could not destroy Todo, please try again",
      }, status: :unprocessible_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
