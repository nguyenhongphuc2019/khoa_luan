# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_11_172719) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_icon"
    t.string "background"
  end

  create_table "document_trackings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_trackings_on_document_id"
    t.index ["user_id"], name: "index_document_trackings_on_user_id"
  end

  create_table "documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.text "description"
    t.integer "total_view"
    t.integer "total_dowload"
    t.string "author_name"
    t.string "source_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "language"
    t.string "type_doc"
    t.index ["category_id"], name: "index_documents_on_category_id"
  end

  create_table "feature_attributes_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "gender"
    t.integer "birth_day"
    t.string "state"
    t.string "main_major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feature_attributes_users_on_user_id"
  end

  create_table "feature_categories_documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "document_id"
    t.string "main_major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_feature_categories_documents_on_document_id"
  end

  create_table "feature_category_documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "document_id"
    t.string "main_major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_feature_category_documents_on_category_id"
    t.index ["document_id"], name: "index_feature_category_documents_on_document_id"
  end

  create_table "feature_documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "document_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "point"
    t.string "gender"
    t.string "status"
    t.string "generation"
    t.index ["document_id"], name: "index_feature_documents_on_document_id"
    t.index ["feature_id"], name: "index_feature_documents_on_feature_id"
  end

  create_table "feature_user_documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "document_id"
    t.string "gender"
    t.string "generation"
    t.string "status"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_feature_user_documents_on_document_id"
  end

  create_table "feature_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "point"
    t.index ["feature_id"], name: "index_feature_users_on_feature_id"
    t.index ["user_id"], name: "index_feature_users_on_user_id"
  end

  create_table "features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "keywordable_id"
    t.string "keywordable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "verb_id"
    t.index ["verb_id"], name: "index_keywords_on_verb_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "name"
    t.string "gender"
    t.integer "birth_day"
    t.string "state"
    t.string "main_major"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verbs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group"
  end

  create_table "votes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "document_trackings", "documents"
  add_foreign_key "document_trackings", "users"
  add_foreign_key "documents", "categories"
  add_foreign_key "feature_attributes_users", "users"
  add_foreign_key "feature_categories_documents", "documents"
  add_foreign_key "feature_category_documents", "categories"
  add_foreign_key "feature_category_documents", "documents"
  add_foreign_key "feature_documents", "documents"
  add_foreign_key "feature_documents", "features"
  add_foreign_key "feature_user_documents", "documents"
  add_foreign_key "feature_users", "features"
  add_foreign_key "feature_users", "users"
  add_foreign_key "keywords", "verbs"
end
