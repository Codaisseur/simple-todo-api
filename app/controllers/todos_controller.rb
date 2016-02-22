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
end
