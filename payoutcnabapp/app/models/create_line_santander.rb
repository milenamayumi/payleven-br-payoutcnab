class CreateLineSantander

  def self.read_file_santander(filename, idarq)

    io = File.open(filename, 'r')

    io.each_line do |line|
      #puts line
      @returnvalue = nil
      @agenciavalue = ""

      retorno = Retorno.new
      retorno.idarquivo = idarq
      retorno.bank = line[20..22] if (line[13] == 'A')
      retorno.type = line[217..218] if (line[13] == 'A')
      retorno.branch = line[24..27] if (line[13] == 'A')
      retorno.account = line[29..42] if (line[13] == 'A')
      retorno.depositshort, retorno.payout = line[73..92] if (line[13] == 'A')
      retorno.name = line[43..72] if (line[13] == 'A')
      retorno.agencia, @agenciavalue = line[36..39] if (line[6] == '0')
      retorno.filedate = line[143..150] if (line[6] == '0')
      retorno.date = line[93..100] if (line[13] == 'A')
      retorno.amount = line[104..133] if (line[13] == 'A')
      retorno.typecompany = line[17..19] if (line[13] == 'A')
      #@retorno.idtype if (line[13] == 'A')
      retorno.idnumber = line[18..31] if (line[13] == 'A')
      #retorno.auth
      #retorno.bankid
      @returnvalue = line[230..237] if (line[13] == 'A')
      retorno.return = @returnvalue

      if @returnvalue.nil? or @returnvalue.empty? or @returnvalue == "" #or @agenciavalue != "0389"
          retorno.result = "Invalid"
      else
        case @returnvalue[0..1]
            when "AP"
              retorno.result = "Invalid"
            when "00"
              retorno.result = "Paid"
            when "03"
              retorno.result = "OP"
            when "NA", "B1", "HU"
              retorno.result = "Not Paid"
            when "BD"
              retorno.result = "Approved"
            else
              retorno.result = "Rejected"
        end
      end

      retorno.save

    end

  end

end