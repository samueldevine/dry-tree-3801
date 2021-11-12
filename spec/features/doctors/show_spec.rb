require 'rails_helper'

RSpec.describe 'The Doctor Show Page' do
  describe 'displays' do
    before :each do
      @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
      @doctor = @hospital.doctors.create(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University"
      )
      visit doctor_path(@doctor)
    end

    it "the doctor's name" do
      expect(page).to have_content @doctor.name
    end

    it "the doctor's specialty" do
      expect(page).to have_content @doctor.specialty
    end

    it "the doctor's university" do
      expect(page).to have_content @doctor.university
    end

    it "the doctor's hospital" do
      expect(page).to have_content @hospital.name
    end

    it "the doctor's patients" do
      @doctor.patients.create!(name: 'Bob Belcher', age: 44)
      @doctor.patients.create!(name: 'Linda Belcher', age: 44)

      visit doctor_path(@doctor)

      within '#patients' do
        expect(page).to have_content 'Bob Belcher'
        expect(page).to have_content 'Linda Belcher'
      end
    end
  end
end
