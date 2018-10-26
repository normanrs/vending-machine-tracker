class Snack < ApplicationRecord
  # belongs_to :machine
  has_many :snack_machines
  has_many :machines, through: :snack_machines
end
