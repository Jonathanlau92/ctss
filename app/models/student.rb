class Student < ApplicationRecord
  enum sex: {male: 0, female: 1}
  enum education_level: {PSLE: 0, NT_level: 1, NA_level: 2, O_level: 3, A_level: 4}

  
end
