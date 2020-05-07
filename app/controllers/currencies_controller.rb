# controller for Currency instance
class CurrenciesController < ApplicationController

  # GET /currencies
  def index
    @currencies = Currency.all
    render json: { data: @currencies }
  end
end
