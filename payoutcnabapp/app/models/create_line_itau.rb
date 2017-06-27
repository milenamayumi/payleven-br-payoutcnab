class CreateLineItau

  def self.read_file_itau(filename, idarq)
    io = File.open(filename, 'r') #open the itau cnab file
    io.each_line do |line|
      #this block registers in the database each line of the itau cnab file
      @returnvalue = nil
      retorno = Retorno.new
      retorno.idarquivo = idarq

      if line[0..2] == "341"
        retorno.alert = "ok"
      else
        retorno.alert = "ALERT"
      end
      retorno.register = line[7]

      if (line[7] == '3')
        if line[203..205] == '000'
          retorno.doctype = "CPF"
          retorno.document =  line[203..216]
        else
          retorno.doctype = "CNPJ"
          retorno.document = line[206..216]
        end
        retorno.depositshort = line[73..79]
        retorno.date = line[93..100]
      end

      retorno.filedate = line[143..150] if (line[7] == '0')
      retorno.amount = line[104..133].to_f / 100
      @returnvalue = line[229..237]
      retorno.return = @returnvalue
      retorno.query = line[73..79] + ','

      if @returnvalue.nil? or @returnvalue.empty? or @returnvalue == "" or @returnvalue == "         "
          retorno.result = "Invalid"
      else
        case @returnvalue[0..2]
            when " AP"
              retorno.result = "Invalid"
            when "000"
              retorno.result = "Paid"
            when "0B1"
              retorno.result = "Not Paid"
            when "0BD"
              retorno.result = "Approved"
            else
              retorno.result = "Rejected"
        end
      end

      retorno.save

    end

  end

end