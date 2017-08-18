class PaymentsQuery

  attr_reader :payment

  def initialize(payment = payment.all)
    @payment = payment.extending(paymentsFilters)
  end

  def filter_payments(params)
     payment.byidarquivo(params[:idarquivo])
    #         .fromdate(params[:initialdate])
    #         .bycpf(params[:cpf])
    #         .bycreditcard(params[:creditcard]) || Transaction.new
  end

  module PaymentsFilters


     def byidarquivo (idarquivo)
         idarquivo.nil? or idarquivo.empty? ? self : where(idarquivo: idarquivo)
     end

    # def fromdate (initialdate)
    #    initialdate.nil? ? self : where("transactions.created_at > ?", initialdate)
    # end
    #
    # def bycpf (cpf)
    #   (cpf.nil? or cpf.empty?) ? self : joins(:customer).where("customers.cpf = ?", cpf)
    # end
    #
    # def bycreditcard (creditcard)
    #   (creditcard.nil? or creditcard.empty?) ? self : where(masked_card_number: creditcard+'x')
    # end

   end

end