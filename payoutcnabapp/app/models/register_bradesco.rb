class RegisterBradesco

  def self.read_file(filename, idarq, brand)

    filename.each_line do |line|
      #this block registers in the database each line of the bradesco cnab file
      @returnvalue = nil
      payment = Payment.new
      payment.idarquivo = idarq
      payment.brand = brand

      if line[0] == '0' or line[0] == '1' or line[0] == '9'
        payment.alert = "ok"
      else
        payment.alert = "ALERT"
      end
      payment.register = line[0]

      if (line[0] == '1')
        if line[1] == '1'
          payment.doctype = "CPF"
          payment.document =  line[2..10] + line[15..16]
        else
          payment.doctype = "CNPJ"
          payment.document =  line[3..16]
        end
        payment.depositshort = line[119..125]
        payment.date = line[165..172]
      end

      payment.filedate = line[78..85] if (line[7] == '0')
      payment.amount = (line[104..133].to_f / 100).round(2)
      @returnvalue = line[278..280]
      payment.return = @returnvalue
      payment.query = line[119..125] + ','

      if @returnvalue.nil? or @returnvalue.empty? or @returnvalue == "" or @returnvalue == "        "
        payment.result = "Invalid"
      else
        case @returnvalue[0..1]
          when "BW"
            payment.result = "Paid"
          when "BI"
            payment.result = "Not Paid"
          when "HA", "HF"
            payment.result = "Approved"
          else
            payment.result = "Rejected"
        end
      end

      payment.save

    end

  end

end