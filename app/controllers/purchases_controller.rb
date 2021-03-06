class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all.order('date DESC').page params[:page]
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: t('.success') }
        format.json { render action: 'show', status: :created,
                             location: @purchase }
      else
        format.html { render action: 'new' }
        format.json { render json: @purchase.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: t('.success') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    purchase_name = @purchase.name
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url,
                                notice: t('.success', purchase: purchase_name) }
      format.json { head :no_content }
    end
  end

  def calendar
    @date = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today
    @purchases = Purchase.where(date: @date.beginning_of_month - 1.week..
        (@date+1.month).beginning_of_month + 1.week)
  end

  def by_date
    @purchases = Purchase.where(date: params[:date]).page params[:page]
    render :index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_params
    params.require(:purchase).permit(:name, :category_id, :price, :date)
  end
end
