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
    body = Body.new(body_params)
    body.write_attribute(:user_id, current_user.id)#bodyのuser_idをcurrent_userのidにする
    if body.valid?
      body.set_calculation_columns
      body.save!
      redirect_to root_path
    else
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
