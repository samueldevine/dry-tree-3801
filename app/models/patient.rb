class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.index
    Patient.all
      .order(age: :desc)
  end
end
