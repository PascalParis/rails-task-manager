class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id].to_i)
  end

  def new
    @task = Task.new
  end

  def create
    @title = params[:title]
    @details = params[:details]

    @task = Task.new(title: @title, details: @details)
    @task.save

  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    @task = Task.find(params[:id].to_i)
    # @task.update(title: params[:task][:title], details: params[:task][:details])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id].to_i)
    @task.destroy
    redirect_to tasks_path
  end

  def task_params
  #   # *Strong params*: You need to *whitelist* what can be updated by the user
  #   # Never trust user data!
    params.require(:task).permit(:title, :details)
  end
end

