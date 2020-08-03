class BodiesController < ApplicationController
  before_action :authenticate_user!
  def index_week
    @bodies = Body.where(user_id:1).where('created_at >= ?',1.week.ago)   
  end
  def index_month
    @bodies = Body.where(user_id:1).where('created_at >= ?',1.month.ago)
  end

  def new
    #新規作成
    body = Body.new
  end

  def create
    body = Body.new(body_params)
    body.write_attribute(:user_id, current_user.id)#bodyのuser_idをcurrent_userのidにする
    if body.valid?
      body.set_calculation_columns
      body.save!
      flash[:positive] = "計測結果を保存しました。"
      redirect_to root_path
    else
      flash[:negative] = "計測結果の保存に失敗しました。入力内容をご確認ください。"
      render 'new'
    end
  end

  def edit
    @body = Body.find(params[:id])
  end

  def update
    body = Body.find(params[:id])
    if body.valid?
      body.assign_attributes(body_params)
      body.set_calculation_columns
      body.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def body_params
      params.require(:body).permit(:height,:weight,:fat_percentage)
    end
end
