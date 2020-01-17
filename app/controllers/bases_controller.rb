class BasesController < ApplicationController
  


  def index
    
    @base = Base.all
  end
  
  def new
    @base = Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "拠点登録しました。"
      redirect_to bases_url
    else
      render :new
    end
  end
  
  def edit
    @base = Base.find(params[:id])
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(base_params)
      flash[:success] = "拠点情報を更新しました。"
      redirect_to bases_url
    else
      redirect_to bases_url
    end
  end
  
  def destroy
    @base.destroy
    flash[:success] = "#{@base.base_name}のデータを削除しました。"
    redirect_to bases_url
  end
  
private
  
  def base_params
    params.require(:base).permit(:id, :base_name, :base_type)
  end


end
