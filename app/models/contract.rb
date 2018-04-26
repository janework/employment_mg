class Contract < ApplicationRecord
  NATURES = ["Contrat de travail à durée indéterminée",
     "Contrat de travail à durée déterminée"]
  TIME_PERIODS = ["mois", "jours"]
  DEFAULT_WEEK_HOURS = 35
  DEFAULT_PAID_VACATION_DAYS = 25
  belongs_to :firm, optional: true
  belongs_to :collab
  before_validation :set_default_firm

end
