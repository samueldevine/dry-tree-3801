class DoctorsController < ApplicationController
  def show
    if params[:id]
      @doctor = Doctor.find(params[:id])
    else
      @doctor = Doctor.find(params[:doctor_id])
    end
  end
end
