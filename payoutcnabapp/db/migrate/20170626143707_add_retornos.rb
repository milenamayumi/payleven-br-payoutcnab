class AddRetornos < ActiveRecord::Migration[5.1]

  def change

    create_table :retornos do |t|

      t.string "idarquivo"    , null: true
      t.string "bank"         , null: true
      t.string "type"         , null: true
      t.string "branch"       , null: true
      t.string "account"      , null: true
      t.string "payout"       , null: true
      t.string "agencia"      , null: true
      t.string "depositshort" , null: true
      t.string "name"         , null: true
      t.string "filedate"     , null: true
      t.string "date"         , null: true
      t.string "amount"       , null: true
      t.string "typecompany"  , null: true
      t.string "idtype"       , null: true
      t.string "idnumber"     , null: true
      t.string "auth"         , null: true
      t.string "bankid"       , null: true
      t.string "return"       , null: true
      t.string "result"       , null: true
      t.string "query"        , null: true
      t.string "soap"         , null: true

      t.string "alert"        , null: true
      t.string "register"     , null: true
      t.string "doctype"      , null: true
      t.string "document"     , null: true
      t.string "paydate"      , null: true

      t.timestamps

    end

  end

end
