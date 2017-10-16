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

ActiveRecord::Schema.define(version: 20170604233530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.string   "link"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "joint_plan_id"
    t.index ["joint_plan_id"], name: "index_attachments_on_joint_plan_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "capital",       null: false
    t.integer  "region_id",     null: false
    t.integer  "sub_region_id", null: false
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "native_name"
    t.string   "alpha2code",    null: false
    t.string   "alpha3code",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["alpha2code"], name: "index_countries_on_alpha2code", unique: true, using: :btree
    t.index ["alpha3code"], name: "index_countries_on_alpha3code", unique: true, using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "typedoc"
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.integer  "type_employee_id",        null: false
    t.integer  "scale_classification_id", null: false
    t.integer  "scale_category_id",       null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_employees_on_user_id", unique: true, using: :btree
  end

  create_table "employees_faculties", id: false, force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "faculty_id",  null: false
    t.index ["employee_id", "faculty_id"], name: "index_employees_faculties_on_employee_id_and_faculty_id", unique: true, using: :btree
  end

  create_table "extensions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "joint_plan_id"
    t.integer  "attachment_id"
    t.boolean  "approved"
    t.date     "new_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["attachment_id"], name: "index_extensions_on_attachment_id", using: :btree
    t.index ["joint_plan_id"], name: "index_extensions_on_joint_plan_id", using: :btree
    t.index ["user_id"], name: "index_extensions_on_user_id", using: :btree
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "acronym",                   null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["acronym"], name: "index_faculties_on_acronym", unique: true, using: :btree
    t.index ["name"], name: "index_faculties_on_name", unique: true, using: :btree
  end

  create_table "joint_plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "status"
    t.date     "begin_plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "end_plan"
    t.index ["user_id"], name: "index_joint_plans_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.boolean  "viewed",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["item_type", "item_id"], name: "index_notifications_on_item_type_and_item_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "reference_lists", force: :cascade do |t|
    t.string   "name",         null: false
    t.text     "description"
    t.string   "value"
    t.integer  "reference_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["reference_id"], name: "index_reference_lists_on_reference_id", using: :btree
  end

  create_table "references", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.integer  "jointplan_id"
    t.integer  "applicant_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
  end

  create_table "universities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "acronym"
    t.integer  "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_universities_on_country_id", using: :btree
  end

  create_table "university_degrees", force: :cascade do |t|
    t.string   "name",               null: false
    t.integer  "university_id",      null: false
    t.integer  "academic_degree_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["university_id"], name: "index_university_degrees_on_university_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name",                        default: "",  null: false
    t.string   "middle_name",                       default: "",  null: false
    t.string   "last_name",                         default: "",  null: false
    t.string   "genre",                   limit: 1, default: "m", null: false
    t.string   "identification_document",           default: "",  null: false
    t.date     "birthday"
    t.string   "email",                             default: "",  null: false
    t.string   "encrypted_password",                default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",                   default: 0,   null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",                 default: 0
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", unique: true, using: :btree
  end

  add_foreign_key "attachments", "joint_plans"
  add_foreign_key "employees", "users"
  add_foreign_key "extensions", "attachments"
  add_foreign_key "extensions", "joint_plans"
  add_foreign_key "extensions", "users"
  add_foreign_key "joint_plans", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "reference_lists", "\"references\"", column: "reference_id"
  add_foreign_key "universities", "countries"
  add_foreign_key "university_degrees", "universities"
end
