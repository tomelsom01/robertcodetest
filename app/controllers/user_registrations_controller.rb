class UserRegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to @registration, notice: 'Registration was successfully created.'
    else
      render :new
    end
  end

  def show
    @registration = Registration.find(params[:id])
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
      redirect_to @registration, notice: 'Registration was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to registrations_url, notice: 'Registration was successfully destroyed.'
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_verified, :verification_token, :reset_token, :roles)
  end
end
