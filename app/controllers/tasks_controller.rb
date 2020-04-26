class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, except: [:create, :new]

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.create(task_params)
    if @task
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'Item was created.' }
      end
    else
      flash[:danger] = 'Item cannot be empty'
    end
  end

  def task_up
    if @task.move_higher
      respond_to do |format|
        format.js
        # format.html { redirect_to action: 'index' }
      end
    end
  end

  def task_down
    if @task.move_lower
      respond_to do |format|
        format.js
        # format.html { redirect_to action: 'index' }
      end
    end
  end

  def destroy
    if @task.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'Item was deleted.' }
      end
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      if @task[:deadline] != nil
        if @task[:deadline] < DateTime.now
          @task.update_attribute(:done, DateTime.now)
        else
          @task.update_attribute(:done, nil)
        end
      end
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'Item was updated.' }
      end
    else
      flash[:danger] = 'Item cannot be empty'
    end
  end

  def complete
    if @task.completed?
      @task.update_attribute(:done, nil)
      @task.update_attribute(:deadline, nil)
    else
      @task.update_attribute(:done, DateTime.now)
    end
    respond_to do |format|
      format.js
      format.html { redirect_to action: 'index', notice: 'Item was updated.' }
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:deadline, :name)
  end
end
