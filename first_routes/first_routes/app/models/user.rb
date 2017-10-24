# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#

class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :artworks,
    source:  :artwork

end


# Ensure a single user cannot have two artworks with the same title.
# On the other hand, two different users can have artworks with the same title.
# In other words, two separate artists could both have artworks of their own
# named "Untitled", but a single artist should not be able to have two pieces
# with that same title.
#
# This means that the artist_id and title combination must be unique.
# Enforce this at the DB and model levels. Here's some help for the model
# validation To add the DB constraint, consider what would happen if we added
# indexing and a uniqueness constraint to not one, but two columns. Check
# this Stack Overflow answer for more info
#
# Add an index on artist_id so that we can quickly get all the artworks
# for a user. Also add associations between User and Artwork. The association
#   from Artwork to User should be called artist. Note that our column in the
#   artworks table does not have to be user_id despite being a foreign key to
#   the users table. In this case, artist_id is much more descriptive and
#     therefore preferable.
