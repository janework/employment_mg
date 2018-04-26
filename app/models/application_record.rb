class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_default_firm
    firm = Firm.first
    self.firm = firm if firm.present?
  end
end
