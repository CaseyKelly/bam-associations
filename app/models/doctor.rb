class Doctor < ActiveRecord::Base
  validates :name, presence: true

  has_many :users, through: :appointments
end
