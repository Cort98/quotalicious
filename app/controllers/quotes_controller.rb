class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong>, the data you entered is invalid.'
      redirect_to root_path
      else
        redirect_to quote_path(Quote.last)
    end
  end

  def about
  end

  def show
    @quote = Quote.last
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
