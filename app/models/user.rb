class User < ApplicationRecord
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

  has_many :songs, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  has_many :songs
  has_many :likes, dependent: :destroy
  has_many :liked_songs, through: :likes, source: :song
  has_many :comments, dependent: :destroy
  has_many :comments
  has_many :commented_songs, through: :comments, source: :song
  mount_uploader :image, ImageUploader
  def already_liked?(song)
    self.likes.exists?(song_id: song.id)
  end
  def comments_songs
    commented_songs.distinct
  end

end