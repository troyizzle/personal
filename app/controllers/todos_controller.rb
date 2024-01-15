class TodosController < ApplicationController
  before_action :authenticate_user!

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        @is_first_todo = current_user.todos.count == 1

        flash[:notice] = 'Todo was successfully created.'

        format.turbo_stream
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @todo,
            partial: 'todos/form',
            locals: { todo: @todo }
          )
        end

        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title,
                                 :description,
                                 :due_date,
                                 :done)
  end
end
