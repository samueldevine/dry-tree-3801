require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    describe '::index' do
      it 'returns a list of all patients, sorted by age from high to low' do
        patient_1 = Patient.create(name: 'Louise Belcher', age: 9)
        patient_2 = Patient.create(name: 'Bob Belcher', age: 44)
        patient_3 = Patient.create(name: 'Tina Belcher', age: 12)

        expect(Patient.index).to eq [patient_2, patient_3, patient_1]
      end
    end
  end
end
