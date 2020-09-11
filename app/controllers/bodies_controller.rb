class BodiesController < ApplicationController
  before_action :authenticate_user!
  before_action :block_second_body, only: [ :new]

  def index_week
    @bodies = Body.where(user_id:current_user.id).where('created_at >= ?',1.week.ago).order(created_at: "DESC")
    set_create_or_edit_path
  end
  def index_month
    @bodies = Body.where(user_id:current_user.id).where('created_at >= ?',1.month.ago).order(created_at: "DESC")
    set_create_or_edit_path
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

    def set_create_or_edit_path
      if @bodies.first == nil #降順にしているからfirst
        flash[:warning] = "計測結果を入力してください。"
        redirect_to bodies_new_path
        return #作成
      end
      if @bodies.first.created_at.strftime('%F') == Time.zone.now.strftime('%F')
        @path = bodies_edit_path(@bodies.first.id) #編集
        @flag = "編集"
      else
        @path = bodies_new_path #作成
        @flag = "作成"
      end
    end

    def block_second_body
      body = Body.where(user_id: current_user.id).last
      if body.nil?
        return
      else
        if body.created_at.strftime('%F') == Time.zone.now.strftime('%F')
          flash[:warning] = "既に今日の計測結果は入力されています。"
          redirect_to root_path#作成
        end
      end
    end


end
