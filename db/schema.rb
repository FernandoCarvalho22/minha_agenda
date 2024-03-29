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

ActiveRecord::Schema.define(version: 20221019210758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.integer  "number"
    t.string   "district"
    t.integer  "zipcode"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "contatos", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "anotacao"
    t.string   "nome_mae"
  end

  create_table "testes", force: :cascade do |t|
    t.string   "nome"
    t.integer  "numero"
    t.decimal  "valor",      precision: 10, scale: 2, default: "0.0"
    t.boolean  "ativo",                               default: true
    t.json     "codigo"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "users"
end
