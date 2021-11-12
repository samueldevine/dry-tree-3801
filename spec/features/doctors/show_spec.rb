require 'rails_helper'

RSpec.describe 'The Doctor Show Page' do
  describe 'displays' do
    before :each do
      hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
      @doctor = hospital.doctors.create(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University"
      )
      visit doctor_path(@doctor)
    end

    it "a doctor's name" do
      expect(page).to have_content @doctor.name
    end

    it "a doctor's specialty" do
      expect(page).to have_content @doctor.specialty
    end

    it "a doctor's university" do
      expect(page).to have_content @doctor.university
    end
  end
end
