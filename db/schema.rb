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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120323194634) do

  create_table "categories", :force => true do |t|
    t.string   "cod_sistema"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downloads", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "total_downloads"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.boolean  "published"
  end

  create_table "notices", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "summary"
    t.integer  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "offers", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "date_inicio"
    t.integer  "published"
    t.integer  "total_clicks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "data_fim"
  end

  create_table "poll_questions", :force => true do |t|
    t.integer  "poll_id"
    t.string   "question"
    t.boolean  "published"
    t.integer  "total_votes", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", :force => true do |t|
    t.string   "name"
    t.boolean  "multiple"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_request_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantidade"
    t.integer  "product_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "valor",              :limit => 10
  end

  create_table "product_requests", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transporter_id"
    t.integer  "reseller_id"
    t.string   "tipo_frete"
    t.text     "informacoes_adicionais"
    t.text     "fatura_para_cliente"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "entrega_rua_numero"
    t.string   "entrega_bairro"
    t.string   "entrega_cidade"
    t.string   "entrega_uf"
  end

  create_table "products", :force => true do |t|
    t.string   "cod_sistema"
    t.string   "nome"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cod_categoria_sistema"
  end

  create_table "representants", :force => true do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "cod_sistema"
  end

  create_table "resellers", :force => true do |t|
    t.integer  "cod_representante"
    t.string   "nome"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "telefone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome_fantasia"
    t.string   "cnpj"
    t.string   "inscricao_estadual"
    t.string   "responsavel"
    t.string   "email"
    t.string   "celular"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "senha"
    t.integer  "representant_id"
    t.string   "cod_sistema"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sibais", :id => false, :force => true do |t|
    t.string   "cod_pais"
    t.string   "cod_estado"
    t.string   "cod_cidade"
    t.string   "cod_zona"
    t.string   "cod_bairro"
    t.string   "bairro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sicids", :id => false, :force => true do |t|
    t.string   "cod_pais"
    t.string   "cod_estado"
    t.string   "cod_cidade"
    t.string   "cidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "siests", :id => false, :force => true do |t|
    t.string   "cod_pais"
    t.string   "cod_estado"
    t.string   "estado"
    t.string   "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sipais", :id => false, :force => true do |t|
    t.string   "cod_pais"
    t.string   "pais"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sirevs", :id => false, :force => true do |t|
    t.string   "cod_revenda"
    t.string   "revenda"
    t.string   "fantasia"
    t.string   "cod_pais"
    t.string   "cod_estado"
    t.string   "cod_cidade"
    t.string   "cod_zona"
    t.string   "cod_bairro"
    t.string   "endereco"
    t.string   "nr"
    t.string   "cep"
    t.string   "telefone"
    t.string   "email1"
    t.string   "email2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizonas", :id => false, :force => true do |t|
    t.string   "cod_pais"
    t.string   "cod_estado"
    t.string   "cod_cidade"
    t.string   "cod_zona"
    t.string   "zona"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supertemporaries", :id => false, :force => true do |t|
    t.string   "field01"
    t.string   "field02"
    t.string   "field03"
    t.string   "field04"
    t.string   "field05"
    t.string   "field06"
    t.string   "field07"
    t.string   "field08"
    t.string   "field09"
    t.string   "field10"
    t.string   "field11"
    t.string   "field12"
    t.string   "field13"
    t.string   "field14"
    t.string   "field15"
    t.string   "field16"
    t.string   "field17"
    t.string   "field18"
    t.string   "field19"
    t.string   "field20"
    t.string   "field21"
    t.string   "field22"
    t.string   "field23"
    t.string   "field24"
    t.string   "field25"
    t.string   "field26"
    t.string   "field27"
    t.string   "field28"
    t.string   "field29"
    t.string   "field30"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temporaries", :force => true do |t|
    t.string   "cod_cat"
    t.string   "categoria"
    t.string   "cod_produto"
    t.string   "produto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transporters", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.boolean  "published"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "total_lidos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.string   "last_login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
