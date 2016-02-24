class AddProjectToTodos < ActiveRecord::Migration
  def change
    add_reference :todos, :project, index: true, foreign_key: true
  end
end
