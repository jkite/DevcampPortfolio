class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item Successfully Updated.' }
      else
        format.html { render :edit }
      end
    end
  end




  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end

end
