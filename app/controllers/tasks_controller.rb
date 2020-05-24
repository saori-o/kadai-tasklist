class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :edit]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    if logged_in?
      @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(10)
    else
      redirect_to login_url
    end
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に登録されました。'
      redirect_to root_url
    else
      flash.now[:denger] = 'Taskが登録されませんでした。'
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'Taskは正常に更新されました。'
     redirect_to root_url
    else
      flash.now[:danger] = 'Taskは正常に更新されませんでした。'
      render 'tasks/edit'
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = 'Taskを削除しました。'
    redirect_to root_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
