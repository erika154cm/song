class Song < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    mount_uploader :image, ImageUploader
    has_many :song_tag_relations, dependent: :destroy
    has_many :tags, through: :song_tag_relations, dependent: :destroy
    def vote(vote_type)
      case vote_type
      when "good"
        increment!(:good_votes_count)
      when "bad"
        increment!(:bad_votes_count)
      when "average"
        increment!(:average_votes_count)
      when "want_to_sing"
        increment!(:want_to_sing_votes_count)
      end
    end
  end
  