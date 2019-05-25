# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ============================初期管理者作成======================================
# User.create!(
#    email: 'aaa@bbb.ccc',
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


# # ==============カートおためし1=========
# Cart.create!(
#    user_id: '1',
#    payment: 1,
#    total_price: '3000',
#    status: 2,

# )

#=====================================

# # ==============カートおためし2=========
# Cart.create!(
#    user_id: '1',
#    payment: 1,
#    total_price: '3000',
#    status: 3,

# )

#=====================================


# #===========カートの中身========
# ItemCart.create!(
#     item_id: '3',
#     cart_id: '1',
#     count: '2',
#     price: '0',


#  )

#============================


# # #===========カートの中身2========
# ItemCart.create!(
#     item_id: '5',
#     cart_id: '1',
#     count: '2',
#     price: '0',


#  )

#============================


#==============ship_to_anotherテスト=======

# ShipToAnother.create!(
#    last_name: '別野',
#    first_name: '発送太郎',
#    last_name_kana: 'ベツノ',
#    first_name_kana: 'ハッソウタロウ',
#    postal_code: '1234567',
#    address: '東京都渋谷区神南１丁目１９−１１',

# )
# #=====================================

# # ==============カートおためし3=========
Cart.create!(
   user_id: '1',
   ship_to_another_id: '1',
   payment: 1,
   total_price: '3000',
   status: 3,

)

#=====================================

