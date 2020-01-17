class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
before_action :correct_user, unless: :admin_user_sub, only: [:edit, :update, :show, :update_one_month]
before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info]
before_action :set_one_month, only: :show

  def index
    @user = User.paginate(page: params[:page], per_page: 10)
  end
  
  def import
    # fileはtmpに自動で一時保存される
    User.import(params[:file])
    flash[:success] = "ユーザ情報をインポートしました。"
    redirect_to users_url
  end
  
  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end
  
  
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = "新規作成に成功しました。"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user_url
    else
      
      redirect_to user_url
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def search
    @user = set_search.paginate(page: params[:page], per_page: 10)
  end
  
  def edit_basic_info
  end
  
  def update_basic_info
    
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
      redirect_to users_url
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
      render :edit
    end
  end
  
  
  
  
 private

    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation, :employee_number, :uid)
    end
    
    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :designated_work_start_time, :designated_work_end_time)
    end
    
    def set_search #ここでのself.はUser.を意味する
      if params[:user].present? && params[:user][:name]
        User.where('name LIKE ?', "%#{params[:user][:name]}%") #検索とnameの部分一致を表示。#User.は省略
      else
        User.all #全て表示。#User.は省略
      end
    end

end