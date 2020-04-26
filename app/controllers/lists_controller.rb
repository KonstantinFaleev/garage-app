class ListsController < ApplicationController
  before_action :set_list, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user

  def index
    @user = User.find(params[:user_id])
    @lists = @user.lists
  end

  def show
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @list = @user.lists.new
  end

  def edit
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])

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
    @user = User.find(params[:user_id])
    @list = @user.lists.create(list_params)

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
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])

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

end