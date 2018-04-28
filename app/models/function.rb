class Function < ApplicationRecord
  has_one :collab
  validates :title, presence: true
end
