class Subscriber < ActiveRecord::Base
  attr_accessible :name, :email, :trapping_code

  validates_presence_of :name, :email, :trapping_code

  validates_uniqueness_of :trapping_code, scope: :email

  has_many :trapped_requests, dependent: :destroy
end
