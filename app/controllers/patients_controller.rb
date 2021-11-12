class PatientsController < ApplicationController
  def index
    @patients = Patient.index
  end
end
