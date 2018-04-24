class Contract < ApplicationRecord
  NATURES = ["Contrat de travail à durée indéterminée",
     "Contrat de travail à durée déterminée"]
  TIME_PERIODS = ["jours", "mois"]
  DEFAULT_WEEK_HOURS = 35
  DEFAULT_PAID_VACATION_DAYS = 25
  belongs_to :firm, optional: true
  belongs_to :collab
  before_validation :set_default_firm

  def set_default_firm
    firm = Firm.first
    self.firm = firm if firm.present?
  end
end
