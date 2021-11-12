class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_count
    doctors.count
  end

  def doctor_universities
    Hospital.joins(:doctors)
      .where(id: id)
      .select('doctors.university AS name')
      .order('name')
      .distinct
  end
end
