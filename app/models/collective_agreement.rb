class CollectiveAgreement < ApplicationRecord
    has_many :firms

  def to_label
    "#{idcc} - #{title}"
  end
end
