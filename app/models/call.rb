class Call < ApplicationRecord
  belongs_to :user
  belongs_to :splain
  validates :judgement, inclusion: { in: [ true, false ] }
  validates :user_id, presence: true
  validates :splain_id, presence: true
end
