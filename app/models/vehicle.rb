class Vehicle < ActiveRecord::Base
  # == Constants ============================================================

  # == Properties ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  belongs_to :customer

  has_many :problems

  has_many :estimates, through: :problems

  # == Validations ==========================================================

  validates :make, presence: true
  validates :year, presence: true
  validates :customer, presence: true

  # == Callbacks ============================================================

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
