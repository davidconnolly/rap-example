class Invoice < ActiveRecord::Base
  # == Constants ============================================================

  # == Properties ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  belongs_to :customer

  has_many :comments, as: :record
  has_many :payments

  has_one :estimate

  # == Validations ==========================================================

  validates :customer, presence: true

  validates :amount_paid, presence: true
  validates :cost_total, presence: true
  
  # == Callbacks ============================================================

  after_initialize :assign_defaults

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  def update_cost_total!
    self.cost_total = self.estimate ? self.estimate.cost : 0
    self.save!
  end

  def update_amount_paid!
    self.amount_paid = self.payments.sum(:amount)
    self.save!
  end

private
  def assign_defaults
    self.cost_total ||= 0
    self.amount_paid ||= 0
  end
end
