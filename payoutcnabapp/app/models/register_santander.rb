class RegisterSantander

  def self.read_file(filename, idarq, brand)

    filename.each_line do |line|
      #puts line
      @returnvalue = nil
      @agenciavalue = ""

      payment = Payment.new
      payment.idarquivo = idarq
      payment.brand = brand
      payment.bank = line[20..22] if (line[13] == 'A')
      payment.tipo = line[217..218] if (line[13] == 'A')
      payment.branch = line[24..27] if (line[13] == 'A')
      payment.account = line[29..42] if (line[13] == 'A')
      payment.depositshort, payment.payout = line[73..92] if (line[13] == 'A')
      payment.name = line[43..72] if (line[13] == 'A')
      payment.agencia, @agenciavalue = line[36..39] if (line[6] == '0')
      payment.filedate = line[143..150] if (line[6] == '0')
      payment.date = line[93..100] if (line[13] == 'A')
      payment.amount = (line[104..133].to_i / 100).round(2) if (line[13] == 'A')

      payment.typecompany = line[17..19] if (line[13] == 'A')
      #@payment.idtype if (line[13] == 'A')
      payment.idnumber = line[18..31] if (line[13] == 'A')
      #payment.auth
      #payment.bankid
      @returnvalue = line[230..237] if (line[13] == 'A')
      payment.return = @returnvalue

      if @returnvalue.nil? or @returnvalue.empty? or @returnvalue == "" #or @agenciavalue != "0389"
          payment.result = "Invalid"
      else
        case @returnvalue[0..1]
            when "AP"
              payment.result = "Invalid"
            when "00"
              payment.result = "Paid"
            when "03"
              payment.result = "OP"
            when "NA", "B1", "HU"
              payment.result = "Not Paid"
            when "BD"
              payment.result = "Approved"
            else
              payment.result = "Rejected"
        end
      end

      payment.save

    end

  end

end