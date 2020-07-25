class Body < ApplicationRecord
  #関連付け
  belongs_to :user

  #バリデーション
  validates :height, :weight, :proper_weight, :fat_percentage, :body_mass_index, :lean_body_mass, :mass_index, numericality: { :greater_than => 0 }
  validates :height, :weight, presence: true

end
