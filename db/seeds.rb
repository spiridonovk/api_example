category=Category.where(name: "First category").create

category.products.create(name: "Ancle", price: 132)
