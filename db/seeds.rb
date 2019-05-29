# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ============================初期管理者作成======================================
#  User.create!(
#     email: 'aaa@bbb.ccc',
#    password: '1111111111',
#    last_name: '管理者',
#    first_name: '太郎',
#    last_name_kana: 'カンリシャ',
#    first_name_kana: 'タロウ',
#    postal_code: '1234567',
#    addres: '東京都渋谷区神南１丁目１９−１１',
#    phone_number: '08012345678',
#    admin: 'true',
# )
# ==============================================================================


# ===============================アーティスト=====================================
# ["AAAA","BBBB","CCCC","DDDD","EEEE","FFFF","GGGG","HHHH","IIII","JJJJ","KKKK","LLLL","MMMM","NNNN","OOOO","PPPP","QQQQ","RRRR","SSSS","TTTT","UUUU","VVVV","WWWW","XXXX","YYYY","ZZZZ"
# ].each do |name|
#   Singer.create!(
#     { singer_name: name }
#   )
# end
# ==============================================================================

# ===============================レーベル========================================
# ["aaaa","bbbb","cccc","dddd","eeee","ffff","gggg"].each do |name|
#   Label.create!(
#     { label_name: name }
#   )
# end
# ==============================================================================

# ===============================ジャンル========================================
# ["ロック","レゲエ","J-POP","洋楽","アニメソング","ゲームソング"].each do |name|
#   Genre.create!(
#     { genre_name: name }
#   )
# end
# ==============================================================================

#=================================ユーザー=======================================
 (1..20).each do |n|
   User.create!(
      email:   "#{n}aa@bbb.ccc",
      password: "#{n}#{n}#{n}#{n}#{n}#{n}",
      last_name: "遊佐",
      first_name: "太郎",
      last_name_kana: "ユーザー",
      first_name_kana: "タロウ",
      postal_code: '1234567',
      addres: '東京都渋谷区神南１丁目１９−１１',
      phone_number: '08012345678',
      admin: 'false'
   ) end
#===============================================================================
