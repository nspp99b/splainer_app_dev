class User < ApplicationRecord
  has_many :splains, dependent: :destroy
  has_many :calls, dependent: :destroy
  has_many :amens, -> { where judgement: true }, class_name: 'Call'
  has_many :facts, through: :amens, class_name: 'Splain', :source => :splain
  has_many :patties, -> { where judgement: false }, class_name: 'Call'
  has_many :whoppers, through: :patties, class_name: 'Splain', :source => :splain
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def truthy_test
    self.splains.collect do |splain|
      splain.truthy?
    end
  end

  def truthful?
    self.truthy_test.count(true) >= truthy_test.length / 2
  end

end
