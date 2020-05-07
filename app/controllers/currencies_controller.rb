# controller for Currency instance
class CurrenciesController < ApplicationController

  # GET /currencies
  def index
    @currencies = Currency.all
    render(json: { data: @currencies }, status: 200)
  end

  # GET /currencies/:id
  def show
    @currency = Currency.find_by(id: params[:id])
    if @currency.nil?
      render(json: { msg: 'Currency not found' }, status: 404)
    else
      render(json: { data: @currency }, status: 200)
    end
  end
end
