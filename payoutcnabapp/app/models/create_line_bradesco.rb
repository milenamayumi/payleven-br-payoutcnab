class CreateLineBradesco

  def self.read_file_bradesco(filename, idarq)

    io = File.open(filename, 'r') #open the bradesco cnab file
    io.each_line do |line|
      #this block registers in the database each line of the bradesco cnab file
      @returnvalue = nil
      retorno = Retorno.new
      retorno.idarquivo = idarq

      if line[0] == '0' or line[0] == '1' or line[0] == '9'
        retorno.alert = "ok"
      else
        retorno.alert = "ALERT"
      end
      retorno.register = line[0]

      if (line[0] == '1')
        if line[1] == '1'
          retorno.doctype = "CPF"
          retorno.document =  line[2..10] + line[15..16]
        else
          retorno.doctype = "CNPJ"
          retorno.document =  line[3..16]
        end
        retorno.depositshort = line[119..125]
        retorno.date = line[165..172]
      end

      retorno.filedate = line[78..85] if (line[7] == '0')
      retorno.amount = line[104..133].to_f / 100
      @returnvalue = line[278..280]
      retorno.return = @returnvalue
      retorno.query = line[119..125] + ','

      if @returnvalue.nil? or @returnvalue.empty? or @returnvalue == "" or @returnvalue == "        "
        retorno.result = "Invalid"
      else
        case @returnvalue[0..1]
          when "BW"
            retorno.result = "Paid"
          when "BI"
            retorno.result = "Not Paid"
          when "HA", "HF"
            retorno.result = "Approved"
          else
            retorno.result = "Rejected"
        end
      end

      retorno.save

    end

  end

end