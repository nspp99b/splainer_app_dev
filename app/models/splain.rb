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

  def amens_count
    self.amens.count
  end

  def patties_count
    self.patties.count
  end

  def truthy?
    self.amens_count >= self.patties_count
  end

  def is_scripture
    Splain.all.collect do |splain|
      splain if splain.amens >= 3 * splain.patties
    end
  end

  def is_manure
    Splain.all.collect do |splain|
      splain if splain.patties >= 3 * splain.amens
    end
  end
end
