class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET categories/1/tasks
  def index
    @tasks = @category.tasks
  end

  # GET categories/1/tasks/1
  def show
  end

  # GET categories/1/tasks/new
  def new
    @task = @category.tasks.build
  end

  # GET categories/1/tasks/1/edit
  def edit
    @task = @category.tasks.find(params[:id])
  end

  # POST categories/1/tasks
  def create
    @task = @category.tasks.build(task_params.merge(userid: current_user.id))

    if @task.save
      redirect_to(@task.category)
    else
      render action: 'new'
    end
  end

  # PUT categories/1/tasks/1
  def update
    if @task.update(task_params.merge(userid: current_user.id))
      redirect_to(@task.category)
    else
      render action: 'edit'
    end
  end

  # DELETE categories/1/tasks/1
  def destroy
    @task.destroy

    redirect_to @category
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end

    def set_task
      @task = @category.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :duedate, :category_id)
    end
end
