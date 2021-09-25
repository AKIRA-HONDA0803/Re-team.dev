# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'test@test',
  password: 'aaaaaa',
)

Genre.create!(
  [
    {
      name: 'ケーキ'
    },
    {
      name: 'プリン'
    },
    {
      name: '焼き菓子'
    },
    {
      name: 'キャンディ'
    }

  ]
)

Product.create!(
  name: "なめらかプリン",
  description: "生クリームを使ってコクがしっかりと感じられる絶品プリンです。",
  genre_id: 2,
  price: 280,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/pudding1.jpg")
  )

Product.create!(
  name: "3種のベリープリン",
  description: "ベリーの酸味と、プリンの甘さが奏でるハーモニー",
  genre_id: 2,
  price: 340,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/pudding2.jpg")
  )

Product.create!(
  name: "ナッツ入りクッキー",
  description: "サクッとした食感とナッツの香ばしさがマッチ‼",
  genre_id: 3,
  price: 150,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/baked_goods1.jpg")
  )

Product.create!(
  name: "マドレーヌ",
  description: "チョコとプレーンの2個セットでの販売、お得感あり!",
  genre_id: 3,
  price: 450,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/baked_goods2.jpg")
  )

Product.create!(
  name: "マカロン",
  description: "マカロン特有のサクッとした食感をお楽しみください!",
  genre_id: 3,
  price: 120,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/baked_goods3.jpg")
  )

Product.create!(
  name: "抹茶のミルクレープ",
  description: "何層にも重なる生地と抹茶のハーモニー！",
  genre_id: 1,
  price: 580,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/cake-1.jpg")
  )

Product.create!(
  name: "チョコレートケーキ",
  description: "全体に広がるチョコの風味をお楽しみください",
  genre_id: 1,
  price: 520,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/cake-2.jpg")
  )
Product.create!(
  name: "ティラミス",
  description: "コーヒーの風味とクリームの甘味をお楽しみに!",
  genre_id: 1,
  price: 600,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/cake-3.jpg")
  )
Product.create!(
  name: "ロリポップ",
  description: "カラフルなキャンディになっています",
  genre_id: 4,
  price: 160,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy1.jpg")
  )
Product.create!(
  name: "フルーツキャンディ",
  description: "果物の味がするキャンディ 100g当たりの値段です",
  genre_id: 4,
  price: 160,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy2.jpg")
  )
Product.create!(
  name: "ハート型キャンディ",
  description: "カラフルなハート形のキャンディです",
  genre_id: 4,
  price: 150,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy3.jpg")
  )

Product.create!(
  name: "ホワイトキャンディ",
  description: "ホワイトチョコでコーティングしたキャンディです",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy4.jpg")
  )
Product.create!(
  name: "チョコキャンディ",
  description: "ビターチョコの苦みとキャンディの甘さをご堪能ください",
  genre_id: 4,
  price: 140,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy5.jpg")
  )
Product.create!(
  name: "ミニキャンディ",
  description: "１００gでの販売、お買い得感満載",
  genre_id: 4,
  price: 160,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy6.jpg")
  )
Product.create!(
  name: "フルーツドロップ",
  description: "お子様にも大人気の商品となっています、ぜひお買い求めください",
  genre_id: 4,
  price: 240,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy7.jpg")
  )


Order.create!(
    member_id: 1,
    shipping_fee: 800,
    bill: 1000,
    postal_code: "1155",
    address: "abc@ff",
    name:"test")

OrderProduct.create!(
    order_id: 1,
    product_id: 1,
    quantity: 10,
    total_price: 2000)

5.times do |n|
    Member.create!(
      email: "test#{n + 1}@test.com",
      name: "テスト太郎#{n + 1}",
      password: "111111",
      first_name: "姓#{n + 1}",
      last_name: "名#{n + 1}",
      kana_first_name: "セイ#{n + 1}",
      kana_last_name: "メイ#{n + 1}",
      postal_code: "0000000",
      address: "大阪市#{n + 1}丁目",
      phone_number: "09000000000",
      is_deleted: [['有効会員',true],['退会会員',false]]
    )
  end
