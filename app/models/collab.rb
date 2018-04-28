class Collab < ApplicationRecord
  GENDERS = ["Homme", "Femme"]
  STATUSES = ["ouvrier", "employé", "technicien", "agent de maîtrise",
    "cadre"]
  CIVILITIES = ["Monsieur","Madame"]
  belongs_to :firm, optional: true
  has_many :contracts
  belongs_to :function
  validates :lastname, presence: true
  has_one :representative, class_name: "Firm", foreign_key: "representative_id"
  before_validation :set_default_firm
  before_validation :format_name

  accepts_nested_attributes_for :function, allow_destroy: true,
    reject_if: proc { |att| att['title'].blank? }

  def format_name
    self.lastname.upcase!
    self.firstname.capitalize!
  end

  def name
  "#{lastname} #{firstname}"
  end

  def civility
    self.gender == GENDERS.first ? CIVILITIES.first : CIVILITIES.last
  end

end
