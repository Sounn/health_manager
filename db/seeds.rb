require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new( name: "tester", email: "test@test.test", password: "password")
user.skip_confirmation!#メール認証をスキップ
user.save!

30.times do |i|
  bd = Body.new(
        user_id:1,
        height:170.32,
        weight:rand(64.00..65.00).round(2),
        fat_percentage: rand(19.00..20.00).round(2),
        created_at: DateTime.now - i
      )
  case i
  when 0..10
    bd.weight += 1
    bd.fat_percentage += 1
  when 11..20
    bd.weight += 2
    bd.fat_percentage += 2
  when 21..25
    bd.weight += 3
    bd.fat_percentage += 4
  when 26..30
    bd.weight += 4
    bd.fat_percentage += 4
  end
  #計算
  bd.body_mass_index = (bd.weight/bd.height/bd.height*10000).round(2)        #BMI(ボディマス指数）,体重/身長^2,
  bd.proper_weight = (bd.height**2*22/10000).round(2)                        #適性体重、身長^2*22
  bd.lean_body_mass = (bd.weight*(100 - bd.fat_percentage)/100).round(2)     #LBM(除脂肪体重） 体重*(100-体脂肪率）/100
  bd.mass_index = (bd.lean_body_mass/bd.height/bd.height*10000).round(2)     #LBMI(筋肉指数LBM/身長＾２
  bd.save
end



