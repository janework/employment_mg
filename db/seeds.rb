User.destroy_all
puts "start of users  seed"
jane = User.create!(email: "jane@gmail.com", password: "azerty", admin: false)
admin = User.create!(email: "admin@gmail.com", password: "azerty", admin: true)
print "users: "
p User.all
puts "End of users seed"

Firm.destroy_all
puts "start of Firm seed"
Firm.create!(name: "IT Place", address: "1 rue Lafeyette, 75009, Paris", siret: 54785471100001,
  rcs: "Paris", legal_form: "SAS", urssaf: "549741542", urssaf_place: "Montreuil",
  collective_agreement: "SYNTEC")
print "Firm : "
p Firm.all
puts "End of Firm seed"

Collab.destroy_all
puts "start of Collab seed"
Collab.create!(firstname: "Jean", lastname: "Olivera", address: "1 rue de l'Opéra, 75001, Paris",
  birth_date: Date.new(1980,2,3), social_security_number: "280037512014525", birth_city: "Paris",
  nationality: "Française", firm_id: 1, gender: "H")
print "Collab : "
p Collab.all
puts "End of Collab seed"

Function.destroy_all
puts "start of Function seed"
Function.create!(title: "commercial", level: "II", coefficient: "55", monthly_starting_salary: 2000 ,
  annual_starting_salary: 26000, bonus: 0, collab_id: 1, status: "agent de maîtrise")
print "Function : "
p Function.all
puts "End of Function seed"

Contract.destroy_all
puts "start of Contract seed"
Contract.create!(hiring_date: Date.new(2018,2,3), mobility_zone: "région Ile de France", nature: Contract::NATURES.first,
task: "prospection, communication, vente, fidélisation des clients", week_work_duration: Contract::DEFAULT_WEEK_HOURS,
paid_vacation_days: Contract::DEFAULT_PAID_VACATION_DAYS, initial_trial_period_duration: 30,
initial_trial_period_type: Contract::TIME_PERIODS.first, firm_id: 1, collab_id: 1)
print "Contract : "
p Contract.all
puts "End of Contract seed"
