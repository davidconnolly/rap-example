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

  after_initialize :init

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

private
  def init
    unless self.cost_total
      self.cost_total = 0
    end
    unless self.amount_paid
      self.amount_paid = 0
    end
  end

end
