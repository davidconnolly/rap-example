class Payment < ActiveRecord::Base
  # == Constants ============================================================

  # == Properties ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  belongs_to :invoice

  # == Validations ==========================================================

  validates :invoice, presence: true

  # Between -$10,000 and $10,000
  validates :amount,
    presence: true,
    :numericality => { :greater_than_or_equal_to => -1000000, :less_than_or_equal_to => 1000000, :other_than => 0 }

  # == Callbacks ============================================================

  after_save :update_amount_paid
  after_destroy :update_amount_paid

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

private
  def update_amount_paid
    self.invoice && self.invoice.update_amount_paid!
  end
end
