class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def show
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
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item Successfully Updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio Item was deleted.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end

end
