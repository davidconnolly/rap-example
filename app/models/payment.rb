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

  after_save :update_invoice
  before_destroy :remove_from_invoice

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

private
  def update_invoice
    if self.invoice
      #puts 'Adding to invoice ' + self.invoice.to_s + ' Payment amount ' + self.cost.to_s + "\n"
      self.invoice.amount_paid = self.invoice.amount_paid - self.amount_was.to_i + self.amount
    end
  end

  def remove_from_invoice
    if self.invoice
      #puts 'Removing from invoice ' + self.invoice.to_s + ' Payment amount ' + self.cost.to_s + "\n"
      self.invoice.amount_paid = self.invoice.amount_paid - self.amount
    end
  end

end
