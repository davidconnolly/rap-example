class Payment < ActiveRecord::Base
  # == Constants ============================================================

  # == Properties ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  belongs_to :invoice

  # == Validations ==========================================================

  validates :invoice, presence: true

  validates :amount, presence: true
  # Between -$10,000 and $10,000
  validates :amount, :numericality => { :greater_than_or_equal_to => -1000000, :less_than_or_equal_to => 1000000 }
  validates :amount, :numericality => { :other_than => 0 }
  
  # == Callbacks ============================================================

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
