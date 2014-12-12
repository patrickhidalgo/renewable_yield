class InvestmentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_investment, only: [:show, :edit, :update, :destroy, :invest, :divest]

  def invest
    if current_user
      current_user.investments << @investment
      redirect_to investments_path, notice: "#{@investment.term} #{@investment.interest_rate} has been moved to your inventory."
    end
  end

  def divest
    @investment.user = nil
    @investment.save
      redirect_to my_investments_path, notice: "#{@investment.term} #{@investment.interest_rate} has been sold!."
    end

  def index
    @investments = Investment.where(user_id: nil).paginate(page: params[:page], per_page: 20)
  end

  def my_investments
    @investments = Investment.where(user_id: current_user.id).paginate(page: params[:page], per_page: 20)
    render 'investments/index'
  end

  def show
  end

  def new
    @investment = Investment.new
  end

  def edit
  end

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
    destroy_message = 'Investment was successfully destroyed.'

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
