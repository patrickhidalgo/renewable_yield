class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]

  def index
    @investors = Investor.all
  end

  def show
  end

  def new
    @investor = Investor.new
  end

  def edit
  end

  def create
    @investor = Investor.new(investor_params)

    respond_to do |format|
      if @investor.save
        session[:id] = @investor.id
        format.html { redirect_to @investor, notice: "Thank you for signing up #{@investor.first_name.titlecase}" }
        format.json { render :show, status: :created, location: @investor }
      else
        format.html { render :new }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @investor.update(investor_params)
        format.html { redirect_to @investor, notice: 'Investor was successfully updated.' }
        format.json { render :show, status: :ok, location: @investor }
      else
        format.html { render :edit }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @investor.destroy
    respond_to do |format|
      format.html { redirect_to investors_url, notice: 'Investor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investor
      @investor = Investor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investor_params
      params.require(:investor).permit(
        :first_name, :middle_name, :last_name, :phone_number,
        :street_address, :city, :state, :zip, :email, :ssn,
        :password, :password_confirmation)
    end
end
