class Collab < ApplicationRecord
  GENDERS = ["Homme", "Femme"]
  STATUSES = ["ouvrier", "employé", "technicien", "agent de maîtrise", "cadre"]
  CIVILITIES = ["Monsieur","Madame"]
  validates :lastname, presence: true
  before_validation :strip_ssn
  validates :social_security_number, numericality: { only_integer: true  },
  allow_blank: true, length: { is: 15 }
  before_validation :set_default_firm
  before_validation :format_name

  belongs_to :firm, optional: true
  belongs_to :fr_nationality, optional: true
  has_many :contracts
  belongs_to :function
  has_one :representative, class_name: "Firm", foreign_key: "representative_id"

  accepts_nested_attributes_for :function, allow_destroy: true,
    reject_if: proc { |att| att['title'].blank? }

  def name
    "#{lastname} #{firstname}"
  end

  def format_name
    self.lastname.upcase!
    self.firstname.capitalize!
  end

  def strip_ssn
      social_security_number.gsub!(/\s+/, '') if !social_security_number.nil?
  end

  def ssn
    if !social_security_number.nil?
      s = social_security_number
      "#{s[0]} #{s[1]}#{s[2]} #{s[3]}#{s[4]} #{s[5]}#{s[6]}" +
        " #{s[7]}#{s[8]}#{s[9]} #{s[10]}#{s[11]}#{s[12]} #{s[13]}#{s[14]}"
    else
      ''
    end
  end

  def civility
    self.gender == GENDERS.first ? CIVILITIES.first : CIVILITIES.last
  end

  def self.default_nationality
    FrNationality.find_by(name: "Française")
  end

end
