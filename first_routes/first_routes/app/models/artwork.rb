# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  # validates :username, presence: true
  validates :title, uniqueness: { scope: :artist_id  }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares

  has_many :shared_viewers,
    through: :artwork_shares,
    source:  :viewer

  # add_index(:artist_id)

  def self.user_artworks(user_id)
    Artwork.left_outer_joins(:artwork_shares)
      .where('artworks.artist_id = :user_id', user_id: user_id)
      .where('artwork_shares.viewer_id = :user_id', user_id: user_id)
  end

end
