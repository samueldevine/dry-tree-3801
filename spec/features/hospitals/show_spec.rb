require 'rails_helper'

RSpec.describe 'The Hospital Show Page' do
  describe 'displays' do
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

      visit hospital_path(@hospital)
    end

    it "the hospital's name" do
      expect(page).to have_content @hospital.name
    end

    it "the number of doctors that work at this hospital" do
      expect(page).to have_content "Number of Doctors at this Hospital: #{@hospital.doctors.count}"
    end

    it "a unique list of universities that this hospital's doctors attended" do
      expect(page).to have_content('Stanford University', count: 1)
      expect(page).to have_content('Smith College', count: 1)
    end
  end
end
