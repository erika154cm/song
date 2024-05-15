class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :song_tag_relations, dependent: :destroy
  has_many :songs, through: :song_tag_relations, dependent: :destroy
end
