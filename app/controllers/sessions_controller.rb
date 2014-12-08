class SessionsController < ApplicationController
  def investor_login

  end

  def investor_create
    investor = Investor.find_by_email(params[:email])
    if investor && investor.authenticate(params[:password])
      session[:id] = investor.id
      redirect_to investments_path,
      notice: "Welcome back #{investor.first_name.titleize}."
    else
      flash[:error] = 'Invalid email or password'
      render :investor_login
    end
  end

  def investor_logout

  end

  def investor_destroy
    if investor = current_investor
      session[:id] = nil
      redirect_to root_path, notice: "#{investor.email} has been logged out."
    end
  end
end
