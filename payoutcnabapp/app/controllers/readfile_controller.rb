

class ReadfileController < ApplicationController
  def index
    file_santander = File.open("spec/tmp/2017-06-santander.txt", "r")
    file_db = File.open("spec/tmp/2017-06-db.txt", "r")
    file_itau = File.open("spec/tmp/2017-06-itau.txt", "r")
    file_bradesco = File.open("spec/tmp/2017-06-bradesco.txt", "r")

    idarq_santander = 1
    idarq_db = 2
    idarq_itau = 3
    idarq_bradesco = 4

    CreateLineSantander::CreateLineSantander.read_file_santander(file_santander, idarq_santander)
    CreateLineDB::CreateLineDB.read_file_db(file_db, idarq_db)
    CreateLineItau::CreateLineItau.read_file_itau(file_itau, idarq_itau)
    CreateLineBradesco::CreateLineBradesco.read_file_bradesco(file_bradesco, idarq_bradesco)

  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

end
