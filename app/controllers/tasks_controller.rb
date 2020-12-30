class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def show
    @task = Task.find_by(id: params[:id])
    @checklists = @task.checklists.paginate(page: params[:page],per_page:5)
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      session[:task_id] = @task.id
      redirect_to @task, notice: "習慣「#{@task.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
  end
  
  private
  
  def task_params
    params.require(:task).permit(:name, :purpose)
  end
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
