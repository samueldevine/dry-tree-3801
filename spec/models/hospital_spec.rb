require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
      @doctor_1 = @hospital.doctors.create(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University"
      )
      @doctor_2 = @hospital.doctors.create(
        name: "Cristina Yang",
        specialty: "Cardiothoracic Surgery",
        university: "Smith College"
      )
      @doctor_3 = @hospital.doctors.create(
        name: "Stanford Doctor 2",
        specialty: "General Surgery",
        university: "Stanford University"
      )
    end

    describe '#doctors_count' do
      it 'returns the number of doctors at that hospital' do
        expect(@hospital.doctors_count).to eq 3
      end
    end

    describe '#doctor_universities' do
      it 'returns a list of unique universities attended by the hospitals doctors' do
        expect(@hospital.doctor_universities.length).to eq 2
        expect(@hospital.doctor_universities.first.name).to eq @doctor_2.university
        expect(@hospital.doctor_universities.last.name).to eq @doctor_1.university
      end
    end
  end
end
