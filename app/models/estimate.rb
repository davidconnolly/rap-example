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
  # Between $0.01 and $10,000
  validates :cost, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 1000000 }
  
  validates :customer, presence: true

  # == Callbacks ============================================================

  after_save :update_invoice
  before_destroy :destroy_invoice

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  def generate_invoice
    unless self.invoice
      Invoice.create( 
        estimate: self, 
        customer: self.customer,
        cost_total: self.cost
      )
    else
      #puts 'Invoice already exists!''
      self.invoice
    end
  end

  # == Instance Methods =====================================================

private
  def update_invoice
    if self.invoice
      #puts 'Adding to invoice ' + self.invoice.to_s + ' Estimate cost ' + self.cost.to_s + "\n"
      self.invoice.cost_total = self.cost
    end
  end

  def destroy_invoice
    if self.invoice
      #puts 'Removing from invoice ' + self.invoice.to_s + ' Estimate cost ' + self.cost.to_s + "\n"
      self.invoice.cost_total = nil
    end
  end

end
