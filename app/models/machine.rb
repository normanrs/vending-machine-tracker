class Machine < ApplicationRecord
  validates_presence_of :location
  belongs_to :owner
  has_many :snacks

  def average_price
    snacks.average(:price).to_i.round(2)
  end

end
