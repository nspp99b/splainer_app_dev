class Splain < ApplicationRecord
  belongs_to :user
  has_many :calls
  has_many :amens, -> { where judgement: true }, class_name: 'Call'
  has_many :supporters, through: :amens, class_name: 'User', :source => :user
  has_many :patties, -> { where judgement: false }, class_name: 'Call'
  has_many :detractors, through: :patties, class_name: 'User', :source => :user  
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
end
