class CreateArquivos < ActiveRecord::Migration[5.1]
  def change
    create_table :arquivos do |t|
      t.string :name
      t.string :brand
      t.string :attachment
      t.timestamps
    end
  end
end
