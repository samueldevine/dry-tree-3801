require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    describe '#hospital_name' do
      it 'returns the name of the hospital that the doctor works at' do
        hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
        doctor = hospital.doctors.create(
          name: "Miranda Bailey",
          specialty: "General Surgery",
          university: "Stanford University"
        )

        expect(doctor.hospital_name).to eq hospital.name
      end
    end
  end
end
