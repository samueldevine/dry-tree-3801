require 'rails_helper'

RSpec.describe 'The Patients Index Page' do
  describe 'displays' do
    it 'the names of all patients from oldest to youngest' do
      bob = Patient.create(name: 'Bob Belcher', age: 44)
      gene = Patient.create(name: 'Gene Belcher', age: 11)
      louise = Patient.create(name: 'Louise Belcher', age: 9)
      tina = Patient.create(name: 'Tina Belcher', age: 12)

      visit patients_path

      expect(bob.name).to appear_before tina.name
      expect(tina.name).to appear_before gene.name
      expect(gene.name).to appear_before louise.name
    end
  end
end
