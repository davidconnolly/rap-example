class Estimate < ActiveRecord::Base
  # == Constants ============================================================

  # == Properties ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  belongs_to :invoice
  belongs_to :customer

  has_many :comments, as: :record
  has_many :problems

  has_many :vehicles, through: :problems

  # == Validations ==========================================================

  validates :cost, presence: true
  # Between $1 and $10,000
  validates :cost, :numericality => { :greater_than_or_equal_to => 100, :less_than_or_equal_to => 1000000 }
  
  validates :customer, presence: true

  # == Callbacks ============================================================

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
