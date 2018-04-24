class Firm < ApplicationRecord
  LEGAL_FORMS = ["SAS",
    "SARL", "SA", "SCI", "Association", "SC",
    "SNC", "GIE", "SCP", "EIRL", "EURL", "SASU"]
  has_many :collabs
  has_many :contracts
  belongs_to :representative, :class_name => 'Collab',
  :foreign_key => 'representative_id', optional: true

  accepts_nested_attributes_for :representative, allow_destroy: true,
    reject_if: proc { |att| att['lastname'].blank? }

end
