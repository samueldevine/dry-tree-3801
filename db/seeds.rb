hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
dr_bailey = hospital.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
bob = dr_bailey.patients.create(name: 'Bob Belcher', age: 44)
linda = dr_bailey.patients.create(name: 'Linda Belcher', age: 44)
