# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

# ============================初期管理者作成======================================
# User.create!(
#    email: 'aaa@bbb.ccc',
#     password: '1111111111',
#     last_name: '管理者',
#     first_name: '太郎',
#     last_name_kana: 'カンリシャ',
#     first_name_kana: 'タロウ',
#     postal_code: '1234567',
#     addres: '東京都渋谷区神南１丁目１９−１１',
#     phone_number: '08012345678',
#     admin: 'true',
#  )
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

# ============================カートおためしカート状態==============================
# Cart.create!(
#    id: '3',
#    user_id: 2,
#    payment: 1,
#    total_price: '3000',
#    status: 1,
# )
# Item_cart.create! (
#   [{item_id: '1',
#   cart_id: 3,
#   count: '2',
#   price: '2000'},
#   {item_id: '2',
#   cart_id: 3,
#   count: '3',
#   price: '3000'}]
# )

# ==============================================================================

# =============================カートおためし未発送================================
# Cart.create!(
#    id: 2,
#    user_id: 2,
#    ship_to_another_id: 1,
#    payment: 2,
#    total_price: 3000,
#    status: 2,
# )
# Item_cart.create! (
#   [{item_id: 2,
#   cart_id: 2,
#   count: 2,
#   price: 2000},
#   {item_id: 3,
#   cart_id: 2,
#   count: 3,
#   price: 3000}]
# )
# ==============================================================================

# =============================カートおためし発送済み===============================
# Cart.create!(
#    id: 1,
#    user_id: 2,
#    payment: 1,
#    total_price: 3000,
#    status: 3,
# )
# Item_cart.create! (
#   [{item_id: 1,
#   cart_id: 1,
#   count: 2,
#   price: 2000},
#   {item_id: 3,
#   cart_id: 1,
#   count: 3,
#   price: 3000}]
# )
# ==============================================================================

# =============================カートおためし発送済み===============================
# Ship_to_another.create! (
#   [{first_name: 天々,
#   last_name: 磔磔,
#   first_name_kana: テンテン,
#   last_name_kana: タクタク,
#   postal_code: 1234567,
#   address: 東京住みだよん},
#   {first_name: 棒棒,
#   last_name: ぽくぽく,
#   first_name_kana: バンバン,
#   last_name_kana: ポクポク,
#   postal_code: 8912345,
#   address: どこどこ住みだよん}]
# )
# ==============================================================================
