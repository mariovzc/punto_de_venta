p "Creando Usuario"
User.create(nombres: 'Mario Vizcaino', email: 'mario14791@hotmail.com')
p "Usuario Creado"
p "Agregando Productos"
Product.where(id: 1, nombre:  'Apple', precio: 0.99).first_or_create
Product.where(id: 2, nombre:  'Orange', precio: 0.49).first_or_create
Product.where(id: 3, nombre:  'Pear', precio: 0.69).first_or_create
Product.where(id: 4, nombre:  'Banana', precio: 0.25).first_or_create
Product.where(id: 5, nombre:  'Peach', precio: 0.69).first_or_create
Product.where(id: 6, nombre:  'Bag of Grapes', precio: 2.99).first_or_create
Product.where(id: 7, nombre:  'Carton of Strawberries', precio: 1.99).first_or_create
Product.where(id: 8, nombre:  'Head of Lettuce', precio: 0.99 ).first_or_create
Product.where(id: 9, nombre:  'Bag of Walnuts', precio: 0.99).first_or_create
Product.where(id: 10, nombre:  'Carton of Mushrooms', precio: 1.49).first_or_create
Product.where(id: 11, nombre:  'Mango', precio: 0.99).first_or_create
Product.where(id: 12, nombre:  'Watermelon', precio: 0.99).first_or_create
Product.where(id: 13, nombre:  'Carton of Cherries', precio: 3.99).first_or_create
Product.where(id: 14, nombre:  'Carton of Blueberries', precio: 3.49).first_or_create
Product.where(id: 15, nombre:  'Carton of Cranberries', precio: 2.39).first_or_create
Product.where(id: 16, nombre:  'Plum', precio: 0.49).first_or_create
Product.where(id: 17, nombre:  'Grapefruit', precio: 1.99).first_or_create
Product.where(id: 18, nombre:  'Pineapple', precio: 2.99).first_or_create
Product.where(id: 19, nombre:  'Carton of Raspberries', precio: 1.99).first_or_create
Product.where(id: 20, nombre:  'Bag of Peanuts', precio: 0.99).first_or_create
p "Productos Agregados"