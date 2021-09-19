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
  name: 'なめらかプリン',
  description: '生クリームを使ってコクがしっかりと感じられる絶品プリンです。',
  genre_id: 2,
  price: 500,
  product_status: true,
  image: File.open("./app/assets/images/pudding1.jpg")
  )