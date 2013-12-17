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

  # Between $0.01 and $10,000
  validates :cost, 
    presence: true, 
    :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 1000000 }
  
  validates :customer, presence: true

  # == Callbacks ============================================================

  after_save :update_invoice_cost_total
  after_destroy :update_invoice_cost_total

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  def generate_invoice!
    self.invoice ||=
      Invoice.create!( 
        customer: self.customer,
        cost_total: self.cost
      )
  end

private
  def update_invoice_cost_total
    self.invoice && self.invoice.update_cost_total!
  end
end
