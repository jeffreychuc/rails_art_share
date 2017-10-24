# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
user1 = User.create(username: 'bob')
user2 = User.create(username: 'bob2')
user3 = User.create(username: 'bob3')
user4 = User.create(username: 'bob4')
user5 = User.create(username: 'bob5')

Artwork.create(title:'bobspiece', image_url:'bobspace.com', artist_id: user1.id)
Artwork.create(title:'george', image_url:'create.com', artist_id: user2.id)
Artwork.create(title:'modern', image_url:'ate.com', artist_id: user2.id)
Artwork.create(title:'jay', image_url:'fate.com', artist_id: user3.id)
Artwork.create(title:'star', image_url:'jay.com', artist_id: user4.id)
Artwork.create(title:'circle', image_url:'boolean.com', artist_id: user5.id)
Artwork.create(title:'question_mark', image_url:'cow.com', artist_id: user5.id)
Artwork.create(title:'?', image_url:'store.com', artist_id: user5.id)

ArtworkShare.create(artwork_id: 1, viewer_id: 1)
ArtworkShare.create(artwork_id: 2, viewer_id: 2)
ArtworkShare.create(artwork_id: 3, viewer_id: 3)
ArtworkShare.create(artwork_id: 4, viewer_id: 4)
ArtworkShare.create(artwork_id: 5, viewer_id: 1)
ArtworkShare.create(artwork_id: 6, viewer_id: 3)
ArtworkShare.create(artwork_id: 7, viewer_id: 5)
ArtworkShare.create(artwork_id: 8, viewer_id: 3)
