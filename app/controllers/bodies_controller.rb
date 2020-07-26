class BodiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @bodies = Body.where(user_id:current_user.id).order(created_at: :DESC )
  end

  def new
    #新規作成
    body = Body.new
  end

  def create
    @body = Body.new(body_params)
    set_current_user_id #bodyのuser_idをcurrent_userのidにする
    if @body.valid?
      @body.set_calculation_columns
      @body.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def body_params
      params.require(:body).permit(:height,:weight,:fat_percentage)
    end

    def set_current_user_id
      @body.user_id = current_user.id
    end
end
