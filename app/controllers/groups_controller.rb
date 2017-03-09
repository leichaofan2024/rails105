class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :havepermit?, only: [:edit, :update, :destroy ]
   def index
     @groups = Group.all
   end
   def show
     @group = Group.find(params[:id])
   end
   def edit
   end
   def update
      if @group.update(group_params)
     redirect_to groups_path, notice:"Update Success"
     else
       render :edit
     end
   end
   def destroy
     @group.destroy
     flash[:alert] = "Destroy successfull"
      redirect_to groups_path
    end
   def new
     @group = Group.new
   end
   def create
     @group = Group.new(group_params)
     @group.user = current_user
     if @group.save
      redirect_to groups_path
    else
      render :new
    end
   end

   private
   def havepermit?
     @group = Group.find(params[:id])
     if current_user != @group.user
       redirect_to groups_path, alert: "你小子没有权限 ！"
     end
   end
   def group_params
    params.require(:group).permit(:title,:description)
   end

end
