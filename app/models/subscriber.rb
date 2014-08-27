class Subscriber < ActiveRecord::Base
  attr_accessible :name, :email, :trapping_code

  validates_presence_of :name, :email, :trapping_code

  validates_uniqueness_of :email
  validates_uniqueness_of :trapping_code, message: "is already registered by other subscriber"

  has_many :trapped_requests, dependent: :destroy
end
