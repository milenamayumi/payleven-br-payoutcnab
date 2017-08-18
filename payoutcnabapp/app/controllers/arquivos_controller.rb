class ArquivosController < ApplicationController
  def index
    @arquivos = Arquivo.all
  end

  def new
    @arquivo = Arquivo.new
  end

  def create
    @arquivo= Arquivo.new(arquivo_params)

    if @arquivo.save
      arq = @arquivo.attachment.read
      brand = 'sumup'
      bank = @arquivo.bank
      success = ReadArquivo::ReadArquivo.read_file(arq, @arquivo.name, brand, bank)
      if success
        redirect_to arquivos_path, notice: "The File #{@arquivo.name} has been uploaded."
      else
        redirect_to arquivos_path, notice: "No reader for bank \"#{@arquivo.bank}\""
      end
    else
      render "new"
    end
  end

  def destroy
    @arquivo = Arquivo.find(params[:id])
    @arquivo.destroy
    redirect_to Arquivos_path, notice:  "The Arquivo #{@arquivo.name} has been deleted."
  end

  private
  def arquivo_params
    params.require(:arquivo).permit(:name, :attachment, :bank)
  end

end