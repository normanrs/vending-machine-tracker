class Machine < ApplicationRecord
  validates_presence_of :location
  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines


  def snacks_average_price
    snacks.average(:price).to_f.round(2)
  end

end
