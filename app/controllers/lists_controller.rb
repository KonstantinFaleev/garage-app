class ListsController < ApplicationController
  before_action :set_user
  before_action :set_list, only: [ :edit, :show, :update, :destroy]

  def index
    @lists = @user.lists
  end

  def show; end

  def new
    @list = @user.lists.new
  end

  def edit; end

  def create
    @list = @user.lists.create(list_params)
    if @list.save
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'List was successfully created.' }
      end
    else
      flash[:danger] = 'List can`t be empty'
    end
  end

  def update
    if @list.update(list_params)
      respond_to do |format|
        format.js
        format.html { redirect_to action: 'index', notice: 'List was updated.' }
      end
    else
      flash[:danger] = 'List can`t be empty'
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
