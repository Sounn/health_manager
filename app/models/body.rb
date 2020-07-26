class Body < ApplicationRecord
  #関連付け
  belongs_to :user

  #バリデーション
  validates :proper_weight, :fat_percentage, :body_mass_index, :lean_body_mass, :mass_index, numericality: { :greater_than => 0 }, allow_nil: true
  validates :height, presence: true, numericality: { :greater_than_or_equal_to => 80, :less_than_or_equal_to => 300 }
  validates :weight, presence: true, numericality: { :greater_than_or_equal_to => 20, :less_than_or_equal_to => 200 }
  validates :fat_percentage, numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }, allow_nil: true

  def set_calculation_columns
    assign_attributes(
      body_mass_index: (weight/height/height*10000).round(2),        #BMI(ボディマス指数）,体重/身長^2,
      proper_weight: (height**2*22/10000).round(2),                  #適性体重、身長^2*22
    )
    if fat_percentage?
      write_attribute(:lean_body_mass, (weight*(100-fat_percentage)/100).round(2))#LBM(除脂肪体重） 体重*(100-体脂肪率）/100
      write_attribute(:mass_index, (lean_body_mass/height/height*10000).round(2))#LBMI(筋肉指数LBM/身長＾２
    end
  end
end
