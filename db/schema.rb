# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_05_07_164624) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_comments_on_song_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "karaoke_tag_relations", force: :cascade do |t|
    t.integer "karaoke_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["karaoke_id"], name: "index_karaoke_tag_relations_on_karaoke_id"
    t.index ["tag_id"], name: "index_karaoke_tag_relations_on_tag_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_likes_on_song_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "song_tag_relations", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_song_tag_relations_on_song_id"
    t.index ["tag_id"], name: "index_song_tag_relations_on_tag_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "aritist"
    t.text "year"
    t.string "about"
    t.string "person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "song_type"
    t.string "composer"
    t.integer "age"
    t.integer "user_id"
    t.string "image"
    t.integer "good_votes_count", default: 0
    t.integer "bad_votes_count", default: 0
    t.integer "average_votes_count", default: 0
    t.integer "want_to_sing_votes_count", default: 0
    t.string "youtube_url"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.string "image"
    t.integer "voted_song_ids"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "songs"
  add_foreign_key "comments", "users"
  add_foreign_key "karaoke_tag_relations", "karaokes"
  add_foreign_key "karaoke_tag_relations", "tags"
  add_foreign_key "likes", "songs"
  add_foreign_key "likes", "users"
  add_foreign_key "song_tag_relations", "songs"
  add_foreign_key "song_tag_relations", "tags"
  add_foreign_key "songs", "users"
end
