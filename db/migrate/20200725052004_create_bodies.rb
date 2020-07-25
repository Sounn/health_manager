class CreateBodies < ActiveRecord::Migration[5.2]
  def change
    create_table :bodies do |t|
      t.references :user, foreign_key: true, null: false #userの外部キー

      t.float :height, null: false  #身長 cm
      t.float :weight, null: false  #体重 kg
      t.float :proper_weight        #適正体重 kg
      t.float :fat_percentage       #体脂肪率 %
      t.float :body_mass_index      #bmi
      t.float :lean_body_mass       #除脂肪体重 kg
      t.float :mass_index           #筋肉量

      t.timestamps
    end
  end
end
