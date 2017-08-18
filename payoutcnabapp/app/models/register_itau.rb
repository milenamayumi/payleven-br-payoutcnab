class RegisterItau

  def self.read_file(filename, idarq, brand)
    filename.each_line do |line|
      #this block registers in the database each line of the itau cnab file
      @returnvalue = nil
      payment = Payment.new
      payment.idarquivo = idarq
      payment.brand = brand

      if line[0..2] == "341"
        payment.alert = "ok"
      else
        payment.alert = "ALERT"
      end
      payment.register = line[7]

      if (line[7] == '3')
        if line[203..205] == '000'
          payment.doctype = "CPF"
          payment.document =  line[203..216]
        else
          payment.doctype = "CNPJ"
          payment.document = line[206..216]
        end
        payment.depositshort = line[73..79]
        payment.date = line[93..100]
      end

      payment.filedate = line[143..150] if (line[7] == '0')
      puts (line[104..133].to_f.round(2)/100).round(2)
      payment.amount = (line[104..133].to_i / 100).round(2)
      @returnvalue = line[229..237]
      payment.return = @returnvalue
      payment.query = line[73..79] + ','

      if @returnvalue.nil? or @returnvalue.empty? or @returnvalue == "" or @returnvalue == "         "
          payment.result = "Invalid"
      else
        case @returnvalue[0..2]
            when " AP"
              payment.result = "Invalid"
            when "000"
              payment.result = "Paid"
            when "0B1"
              payment.result = "Not Paid"
            when "0BD"
              payment.result = "Approved"
            else
              payment.result = "Rejected"
        end
      end

      payment.save

    end

  end

end