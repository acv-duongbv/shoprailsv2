require "active_support"

require_relative "webhoseio"
Category.destroy_all
Product.destroy_all
User.destroy_all

Category.create!(name: "action")
Category.create!(name: "adventure")
Category.create!(name: "westerns")
Category.create!(name: "cartoons")

webhoseio = Webhoseio.new("dd00ac5e-6554-42bc-a01f-183a16b98f47")
list_cate = ["action", "adventure", "westerns", "cartoons"]
list_cate.each do |cate|
  query_params = {
    'q': "category:#{cate} category:movies",
  }
  puts query_params
  output = webhoseio.query("productFilter", query_params)
  cate_id = Category.find_by_name("#{cate}").id
  output["products"].each do |item|
    if item["images"].blank?
      next
    end
    puts item["name"]
    Product.create!(name: item["name"],
                    description: item["description"],
                    price: item["price"],
                    image_url: item["images"].first,
                    category_id: cate_id)
  end
end
