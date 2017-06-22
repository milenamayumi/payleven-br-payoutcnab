

class ReadfileController < ApplicationController
  def index
    file = File.open("spec/tmp/2017-06-santander.txt", "r")
    idarq = 1
    CreateLineSantander::CreateLineSantander.read_file_santander(file, idarq) # array de objetos Arquivo
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
