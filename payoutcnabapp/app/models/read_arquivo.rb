class ReadArquivo

  def self.read_file(arquivo, idarq, brand, bank)
      case bank
        when 'santander'
          RegisterSantander.read_file(arquivo, idarq, brand)
        when 'bradesco'
          RegisterBradesco.read_file(arquivo, idarq, brand)
        when 'itau'
          RegisterItau.read_file(arquivo, idarq, brand)
        when 'db'
          RegisterDB.read_file(arquivo, idarq, brand)
        else
          return false
      end
      return true
  end

end