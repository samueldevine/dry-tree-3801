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
      bob = @doctor.patients.create(name: 'Bob Belcher', age: 44)
      linda = @doctor.patients.create(name: 'Linda Belcher', age: 44)

      visit doctor_path(@doctor)

      within '#patients' do
        expect(page).to have_content bob.name
        expect(page).to have_content linda.name
      end
    end
  end

  describe "remove a patient button" do
    before :each do
      hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
      @doctor = hospital.doctors.create(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University"
      )
      @bob = @doctor.patients.create(name: 'Bob Belcher', age: 44)
      @linda = @doctor.patients.create(name: 'Linda Belcher', age: 44)
    end

    it "exists next to each patient's name" do
      visit doctor_path(@doctor)

      within '#patients' do
        expect(page).to have_button("Remove #{@bob.name} from caseload")
        expect(page).to have_button("Remove #{@linda.name} from caseload")
      end
    end

    it "removes a patient from the doctor's caseload" do
      visit doctor_path(@doctor)

      within '#patients' do
        click_button("Remove #{@bob.name} from caseload")
      end

      expect(current_path).to eq doctor_path(@doctor)

      within '#patients' do
        expect(page).to_not have_content @bob.name
        expect(page).to_not have_button("Remove #{@bob.name} from caseload")
        expect(page).to have_content @linda.name
      end
    end
  end
end
