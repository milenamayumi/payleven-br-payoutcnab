class Payment < ApplicationRecord

  attr_accessor :payments

  def get_result(params)
    set_payments(params)
    return self
  end

  def set_payments(params)
    @payments = Payment.all
    #@payments = paymentsQuery.new.filter_payments(params).to_a
  end

  def set_tpv
    #(@number.to_i != 0) ? @tpv = @amount / @number : @tpv = 0
  end

  def set_amount
    #@amount = self.sumamount(@transactions)
  end

  def set_number
    #@number = self.count(@transactions)
  end

  def set_initialdate
    #@initialdate = Date.today - @range.to_i
  end

  def set_finaldate
    #@finaldate = Date.today
  end

  def sumamount(transactions)
    #(transactions.map {|t| t['amount']}.reduce(0, :+))
  end

  def count(transactions)
    #transactions.nil? ? 0 : transactions.size
  end

end
