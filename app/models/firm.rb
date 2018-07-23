class Firm < ApplicationRecord
  LEGAL_FORMS = ["SAS",
    "SARL", "SA", "SCI", "Association", "SC",
    "SNC", "GIE", "SCP", "EIRL", "EURL", "SASU"]
  has_many :collabs
  has_many :contracts
  
  validates :name, presence: true
  validates :address, presence: true
  validates :siret, presence: true
  validates :rcs, presence: true
 
  belongs_to :representative, :class_name => 'Collab',
  :foreign_key => 'representative_id', optional: true
  belongs_to :collective_agreement, optional: true

  accepts_nested_attributes_for :representative, allow_destroy: true,
    reject_if: proc { |att| att['lastname'].blank? }

  accepts_nested_attributes_for :collective_agreement, allow_destroy: true,
      reject_if: proc { |att| att['idcc'].blank? }

  def simple_collabs
    Collab.where.not(id: self.representative_id)
  end

end
