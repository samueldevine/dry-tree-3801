class DoctorPatientsController < ApplicationController
  def destroy
    record_to_remove = DoctorPatient.find_by(
      doctor_id: params[:doctor_id],
      patient_id: params[:id]
    )
    record_to_remove.destroy

    doctor = Doctor.find(params[:doctor_id])
    redirect_to doctor_path(doctor)
  end
end
