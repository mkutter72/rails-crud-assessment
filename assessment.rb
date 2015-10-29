require 'csv'
# Assessment answers to:

# question 2:
Licensee.create! surname: 'Bishop', given_name: 'Caren', gender: 'f', height: 63, weight: 132, dob: '1943-09-26', eye_color: 'Brown', hair_color: 'Black'

# question 3:
Licensee.transaction do
  CSV.foreach(Rails.root + 'data/licensees.csv',
              headers: true) do |licensee_row|
    licensee = licensee_row.to_hash
    next if Licensee.exists? licensee
    Licensee.create! licensee
  end
end

# question 4:
p Licensee.where('eye_color = :eye_color and hair_color in (:hair_colors) ', eye_color: 'Hazel', hair_colors: %w( Brown Black))

# question 5:
maryilyn = Licensee.find_by! surname: 'Escobar', given_name: 'Marilynn'
maryilyn.height -= 1
maryilyn.save!
chris = Licensee.find_by! surname: 'Whaley', given_name: 'Chris'
chris.height -= 1
chris.save!

# question 6:
dylan = Licensee.find_by! surname: 'Rich', given_name: 'Dylan'
teresita = Licensee.find_by! surname: 'Myers', given_name: 'Teresita'
dylan.destroy!
teresita.destroy!
