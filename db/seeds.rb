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
  price: 500,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/pudding1.jpg")
  )

Product.create!(
  name: "3種のベリープリン",
  description: "ベリーの酸味と、プリンの甘さが奏でるハーモニー",
  genre_id: 2,
  price: 500,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/pudding2.jpg")
  )

Product.create!(
  name: "焼き菓子1",
  description: "1",
  genre_id: 3,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/baked_goods1.jpg")
  )

Product.create!(
  name: "焼き菓子2",
  description: "2",
  genre_id: 3,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/baked_goods2.jpg")
  )

Product.create!(
  name: "焼き菓子3",
  description: "3",
  genre_id: 3,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/baked_goods3.jpg")
  )

Product.create!(
  name: "ケーキ1",
  description: "1",
  genre_id: 1,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/cake-1.jpg")
  )

Product.create!(
  name: "ケーキ2",
  description: "2",
  genre_id: 1,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/cake-2.jpg")
  )
Product.create!(
  name: "ケーキ3",
  description: "1",
  genre_id: 1,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/cake-3.jpg")
  )
Product.create!(
  name: "キャンディ1",
  description: "1",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy1.jpg")
  )
Product.create!(
  name: "キャンディ2",
  description: "2",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy2.jpg")
  )
Product.create!(
  name: "キャンディ3",
  description: "3",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy3.jpg")
  )

Product.create!(
  name: "キャンディ4",
  description: "4",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy4.jpg")
  )
Product.create!(
  name: "キャンディ5",
  description: "5",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy5.jpg")
  )
Product.create!(
  name: "キャンディ6",
  description: "6",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy6.jpg")
  )
Product.create!(
  name: "キャンディ7",
  description: "7",
  genre_id: 4,
  price: 1000,
  product_status: [['販売中',true],['販売停止中',false]],
  image: File.open("./app/assets/images/candy7.jpg")
  )


