class ListsController < ApplicationController
  before_action :set_list, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user
  before_action :set_user
  before_action :set_user_lists, only: [ :show, :edit, :update, :destroy]

  def index
    @lists = @user.lists
  end

  def show; end

  def new
    @list = @user.lists.new
  end

  def edit; end

  def update
    if @list.update(list_params)
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'List was updated.' }
      end
    else
      flash[:danger] = 'List cannot be empty'
    end
  end

  def create
    @list = @user.lists.build(list_params)
    if @list.save
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'List was successfully created.' }
      end
    else
      flash[:danger] = 'List cannot be empty'
    end
  end

  def destroy
    if @list.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'List was deleted.' }
      end
    end
  end

  private

  def check_user
    if current_user != User.find(params[:user_id])
      redirect_to root_path
    end
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_lists
    @list = @user.lists.find(params[:id])
  end
end
