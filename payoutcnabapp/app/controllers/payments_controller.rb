class PaymentsController < ApplicationController
  def index
  end

  def show
    params[:arqid] = '1'
    @result = Payment.new.get_result(params)
  end

  def create
  end

  def update
  end

  def destroy
  end
end