class GroupsController < ApplicationController
  def new
    @user = current_user
    @group = Group.new #情報を入れるためのもの(エラー文)
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:notice] = "投稿に成功しました！"
      redirect_to group_path(@group.id)
    else
      @user = current_user
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.user_id == current_user.id && @group.update(group_params)
      redirect_to group_path(@group.id) 
    else
      render :edit
    end
  end

  def destroy
      group = Group.find(params[:id])
      if @group.user_id == current_user.id
        group.destroy 
      end
      redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:title, :body)
  end
end
