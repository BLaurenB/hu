class Seed

  def self.run
    new.run
  end

  Category.create(title: "Motor vehicle and parts dealers", code: 441)
  Category.create(title: "Automobile and other motor vehicle dealers", code: 4451)
  Category.create(title: "Automobile dealers", code: 4451)
  Category.create(title: "New car dealers", code: 44111)
  Category.create(code: 44112, title: "Used car dealers")
  Category.create(code: 4413, title: "Automotive parts, acc., and tire stores")
  Category.create(code: 443, title: "Furniture, home furn, electronics, and appliance stores")
  Category.create(code: 442, title: "Furniture and home furnishings stores")
  Category.create(code: 4421, title: "Furniture stores")
  Category.create(code: 4422, title: "Home furnishings stores")
  Category.create(code: 44221, title: "Floor covering stores")
  Category.create(code: 442299, title: "All other home furnishings stores")
  Category.create(code: 443, title: "Electronics and appliance stores")
  Category.create(code: 44311, title: "Appl.,TV, and other elect. stores")
  Category.create(code: 443111, title: "Household appliance stores")
  Category.create(code: 443112, title: "Radio, T.V., and other elect. stores")
  Category.create(code: 44312, title: "Computer and software stores")
  Category.create(code: 444, title: "Building mat. and garden equip. and supplies dealers")
  Category.create(code: 4441, title: "Building mat. and supplies dealers")
  Category.create(code: 45322, title: "Gift, novelty, and souvenir stores")
  # Category.create(code: 0000, title: "Stores")
  # Category.create(code: 0000, title: "Stores")
  # Category.create(code: 0000, title: "Stores")


  #
  # 44412	Paint and wallpaper stores
  # 44413	Hardware stores
  # 445	Food and beverage stores
  # 4451	Grocery stores
  # 44511	Supermarkets and other grocery (except convenience) stores
  # 4453	Beer, wine, and liquor stores
  # 446	Health and personal care stores
  # 44611	Pharmacies and drug stores
  # 447	Gasoline stations
  # 448	Clothing and clothing access. stores
  # 4481	Clothing stores
  # 44811	Men's clothing stores
  # 44812	Women's clothing stores
  # 44814	Family clothing stores
  # 44819	Other clothing stores
  # 4482	Shoe stores
  # 44831	Jewelry stores
  # 451	Sporting goods, hobby, book, and music stores
  # 45111	Sporting goods stores
  # 45112	Hobby, toy, and game stores
  # 451211	Book stores
  # 452	General merchandise stores
  # 4521	Department stores (excl. L.D)
  # 452112	Discount dept. stores (excl. L.D)
  # 452111	Department stores(excl. discount department stores, excl. L.D.)
  # 4521	Department stores (incl. L.D.)
  # 452112	Discount dept. stores (incl. L.D.)
  # 452111	Department stores(excl. discount department stores, incl. L.D.)
  # 4529	Other general merchandise stores
  # 45291	Warehouse clubs and superstores
  # 45299	All other gen. merchandise stores
  # 453	Miscellaneous store retailers
  # 4532	Office supplies, stationery, and gift stores
  # 45321	Office supplies and stationery stores
  # 45322	Gift, novelty, and souvenir stores
  # 45330	Used merchandise stores
  # 454	Nonstore retailers
  # 4541	Electronic shopping and mail-order houses
  # 45431	Fuel dealers
  # 722	Food services and drinking places
  # 7221	Full service restaurants
  # 7222	Limited service eating places
  # 7224	Drinking places


  user =    User.create
  auth =    Authentication.create(provider: "google", uid: "googleid", name: "test_uesr_name", oauth_token: "12345", oauth_expires_at: nil, user_id: user.id)

  venture_1 =   Venture.create(title: "Lollipop Stand", description: "sell lollipops", notes: "notes!", user_id: user.id, category_id: Category.last.id)
  snapshot_1 =  Snapshot.create(venture_id: venture_1.id, file: nil)
  term_1 =      Term.create(venture_id: venture_1.id, snapshot_id: snapshot_1.id, words: ["candy", "artisanal lollipop", "organic lollipop", "sugar"])




  #
  # def update_orders_with_totals
  #   Order.all.each do |order|
  #     order_total = OrderItem.where(order_id: order.id).map{|oi| oi.unit_price * oi.quantity}.sum
  #     order.update(total: order_total, shipping: 5.0)
  #
  #   end
  # end
  #
  # def run
  #   update_orders_with_totals
  # end

end



# Seed.run
