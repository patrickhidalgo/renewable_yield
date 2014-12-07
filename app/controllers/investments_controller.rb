class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  # GET /investments
  # GET /investments.json
  def index
    @investments = Investment.all
  end

  # GET /investments/1
  # GET /investments/1.json
  def show
  end

  # GET /investments/new
  def new
    @investment = Investment.new
  end

  # GET /investments/1/edit
  def edit
  end

  # POST /investments
  # POST /investments.json
  def create
    @investment = Investment.new(investment_params)
    creation_message = "#{@investment.term} year #{@investment.interest_rate}% rate was successfully created."
    respond_to do |format|
      if @investment.save
        format.html { redirect_to @investment, notice: creation_message }
        format.json { render :show, status: :created, location: @investment }
      else
        format.html { render :new }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investments/1
  # PATCH/PUT /investments/1.json
  def update
    respond_to do |format|
      update_message = "#{@investment.term} year #{@investment.interest_rate}% rate was successfully updated."

      if @investment.update(investment_params)
        format.html { redirect_to @investment, notice: update_message }
        format.json { render :show, status: :ok, location: @investment }
      else
        format.html { render :edit }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    destroy_message = "#{@investment.term} year #{@investment.interest_rate}% rate was successfully deleted."

    @investment.destroy
    respond_to do |format|
      format.html { redirect_to investments_path, notice: destroy_message }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_investment
    @investment = Investment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def investment_params
    params.require(:investment).permit(:term, :interest_rate, :minimum_order, :denomination, :maturity_date, :issue_date, :offer_start_period, :offer_end_period)
  end
end
