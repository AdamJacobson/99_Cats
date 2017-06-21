# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
hobbes = Cat.create(name: 'Hobbes', color: 'Tiger', birth_date: '2000/01/20', sex: 'M', description: 'Stuffed tiger')
wendy = Cat.create(name: 'Wendy', color: 'Tuxedo', birth_date: '2005/01/20', sex: 'F', description: 'Angry')
willy = Cat.create(name: 'Willy', color: 'Tabby', birth_date: '1000/01/20', sex: 'M', description: 'Feline deity of the Aztecs')

CatRentalRequest.destroy_all
CatRentalRequest.create(cat_id: hobbes.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING')
CatRentalRequest.create(cat_id: hobbes.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING')
CatRentalRequest.create(cat_id: hobbes.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING')

CatRentalRequest.create(cat_id: wendy.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'APPROVED')

CatRentalRequest.create(cat_id: willy.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'APPROVED')
